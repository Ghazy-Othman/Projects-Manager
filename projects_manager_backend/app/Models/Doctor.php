<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Doctor extends Authenticatable
{
    use HasFactory , HasApiTokens , Notifiable;

    //
    protected $primaryKey = 'doctor_id' ;


    //
    public $timestamps = false;

    //
    protected $fillable = [
        'first_name' , 
        'last_name' ,
        'email' ,
        'password' ,
        'section',
        'max_number_of_groups' ,
        'status'
    ] ;


   public function groups() : HasMany 
   {
        return $this->hasMany(Group::class , 'doctor_id') ;
   }

}
