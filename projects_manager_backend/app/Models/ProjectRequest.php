<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectRequest extends Model
{
    use HasFactory;


    //
    protected $primaryKey = 'project_request_id' ;


    //
    public $timestamps = false;

    //
    protected $fillable = [
        'group_id' , 
        'doctor_id' ,
        'project_title' ,
        'project_about',
        'status'
    ] ;
}
