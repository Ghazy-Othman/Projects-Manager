<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;


    //
    protected $primaryKey = 'project_id' ;


    //
    public $timestamps = false;


    //
    protected $fillable = [
        'title' ,
        'about' 
    ] ;


        

}
