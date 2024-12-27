<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//========================================
//             Studets Table
//========================================
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id('student_id');
            $table->string('ssn')->unique() ;
            $table->string('university_id') ;
            $table->string('first_name');
            $table->string('mid_name');
            $table->string('last_name');
            $table->string('section');
            $table->integer('year_of_study') ;
            $table->string('email')->unique()->nullable();
            $table->string('password')->nullable(); 

            // TODO : Add relations first    
             $table->integer('group_id')->nullable() ;  

            // No need of this
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
