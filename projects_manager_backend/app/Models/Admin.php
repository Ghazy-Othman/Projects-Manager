<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use HasFactory, HasApiTokens , Notifiable;



    //
    protected $primaryKey = 'admin_id';


    //
    public $timestamps = false;


    //
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
        'section',
        'start_date',
        'end_date',
        'mix',
        'min_number',
        'max_number',
        'max_doctor_groups'
    ];

    protected $casts = [
        'mix' => 'boolean'
    ]; 
}
