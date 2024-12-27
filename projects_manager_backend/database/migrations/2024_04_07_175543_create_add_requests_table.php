<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//========================================
//             Add Requests Table
//========================================
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('add_requests', function (Blueprint $table) {
            $table->id('add_request_id');
            $table->integer('group_id') ;
            $table->integer('sender_student_id') ;
            $table->integer('reciver_student_id') ;
            // Add request status : 
            // 0 : rejected
            // 1 : accepted
            // 2 : waiting
            $table->integer('status')->default(2) ;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('add_requests');
    }
};
