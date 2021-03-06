<?php

namespace App\System;

class Device
{
    protected $project;
    protected $type;
    protected $code;

    public function __construct($project, $info)
    {
        $this->project = $project;
        $this->type    = $info['type'];
        $this->code    = $info['devcode'];
    }

    public function __get($prop)
    {
        if (isset($this->$prop)) {
            return $this->$prop;
        }

        return null;
    }

    protected function getDb()
    {
        $di = \Phalcon\Di::getDefault();
        return $di->get('db');
    }

    public function getProject()
    {
        return $this->project;
    }

    public function getType()
    {
        return $this->type;
    }

    public function getCode()
    {
        return $this->code;
    }

    public function getTable()
    {
        return 'p'.$this->project->id.'_'.str_replace('-', '_', $this->code);
    }

    public function getTableColumns()
    {
        $table = $this->getTable();
        $columns = $this->getDb()->fetchAll("DESC $table");
        return array_column($columns, 'Field');
    }

    public function getTotalPower($start, $end)
    {
        $table = $this->getTable();

        $col = ($this->type == 'gcp') ? 'M_Gen_real_enrg' : 'Gen_Total_kW';
        $sql = "SELECT SUM($col) AS totalpower
                  FROM $table
                 WHERE time_utc >= CONVERT_TZ('$start', 'EST', 'UTC') AND
                       time_utc <= CONVERT_TZ('$end',   'EST', 'UTC') AND error=0";
        $row = $this->getDb()->fetchOne($sql);
        return $row['totalpower'];
    }

    public function export($file, $start, $end)
    {
        $table = $this->getTable();

        # CONVERT_TZ(time_utc, 'UTC', 'America/Toronto')

        $sql = "SELECT *, CONVERT_TZ(time_utc, 'UTC', 'EST') AS time
                  FROM $table
                 WHERE time_utc >= CONVERT_TZ('$start', 'EST', 'UTC') AND
                       time_utc <  CONVERT_TZ('$end',   'EST', 'UTC')
              ORDER BY time_utc";

        $result = $this->getDb()->query($sql);

        $columns = $this->getTableColumns();
        $columns[0] = 'time'; // time_utc => time
        fputcsv($file, $columns);

        while ($row = $result->fetch(\Phalcon\Db::FETCH_ASSOC)) {
            $row['time_utc'] = $row['time'];
            unset($row['time']);
            fputcsv($file, $row);
        }

        fputs($file, PHP_EOL);
    }
}
