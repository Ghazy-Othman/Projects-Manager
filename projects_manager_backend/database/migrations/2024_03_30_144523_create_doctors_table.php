<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//========================================
//              Doctors Table
//========================================
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('doctors', function (Blueprint $table) {
            $table->id('doctor_id');
            $table->string("first_name") ;
            $table->string("last_name") ;
            $table->string("email")->unique();
            $table->string("password") ;
            $table->string("section") ;
            $table->integer("max_number_of_groups")->default(0);
            
            // The other status is : Not Available
            $table->string('status')->default('Inactive') ;
            
            // No need of this
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('doctors');
    }
};
