<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Student extends Authenticatable
{
    use HasFactory , HasApiTokens , Notifiable;
    


    // If want (ssn) to be id , use :
    //
    // protected $primaryKey = 'ssn' ;
    // public $incrementing = false ;
    // protected $keyType = 'string' ;
    
    //
    protected $primaryKey = 'student_id' ;
    
    
    //
    public $timestamps = false;
    
    
    //
    protected $fillable = [
        'ssn' , 
        'university_id' ,
        'first_name' ,
        'mid_name' ,
        'last_name' ,
        'section' ,
        'year_of_study' ,
        'email' ,
        'password',
        'group_id' 
    ] ;

    //
    protected $hidden = [
        'password',
    ];


    // Student belongs to one group
    public function group() : BelongsTo {
        return $this->belongsTo(Group::class , 'group_id') ;
    }
    
}
