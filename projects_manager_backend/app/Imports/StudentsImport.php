<?php

namespace App\Imports;

use App\Models\Student;
use Maatwebsite\Excel\Concerns\ToModel;

class StudentsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Student([
            'ssn' => $row[0] ,
            'university_id' => $row[1] ,
            'first_name' => $row[2] ,
            'mid_name' => $row[3] ,
            'last_name' => $row[4] ,
            'section' => $row[5] ,
            'year_of_study' => $row[6] ,
        ]);
    }
}
