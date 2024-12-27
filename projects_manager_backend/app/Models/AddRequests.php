<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AddRequests extends Model
{
    use HasFactory;


    //
    protected $primaryKey = 'add_request_id' ;

    
    //
    protected $fillable = [
        'group_id' , 
        'sender_student_id' ,
        'reciver_student_id' , 
        'status'
    ];


    public function senderStudent() : BelongsTo  {
        return $this->belongsTo(Student::class , "sender_student_id") ;
    }

    
}
