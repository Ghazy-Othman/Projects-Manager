<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Group extends Model
{
    use HasFactory;


    //
    protected $primaryKey = 'group_id' ;


    //
    public $timestamps = false;


    
    //
    protected $fillable = [
        'student_id' , 
        'doctor_id' ,
        'project_id' 
    ];




    // Group has many students belong to it 
    public function students()  : HasMany{
        return $this->hasMany(Student::class , 'group_id') ;
        
    }

    
}
