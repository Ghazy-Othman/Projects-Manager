<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//========================================
//        Projects Requests Table
//========================================
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('project_requests', function (Blueprint $table) {
            
            $table->id('project_request_id');
            $table->integer('group_id') ;
            $table->integer('doctor_id') ;
            $table->string('project_title') ;
            $table->text('project_about') ;
            $table->integer('status') ;


            // No need for this
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_requests');
    }
};
