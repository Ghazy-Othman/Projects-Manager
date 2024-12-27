<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

//========================================
//             Admins Table
//========================================
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id('admin_id');
            $table->string("first_name");
            $table->string("last_name");
            $table->string("email")->unique();
            $table->string("password");
            $table->string("section");

            // Must be date
            $table->string("start_date")->nullable();
            $table->string("end_date")->nullable();

            // Form condition
            //
            // Mix available or not 
            $table->boolean("mix")->nullable();
            // Min number of students at one group
            $table->integer("min_number")->nullable();
            // Max number of students at one group
            $table->integer("max_number")->nullable();
            // Max number of groups for doctor with same section of admin 
            $table->integer("max_doctor_groups")->default(0) ;

            // No need of this 
            // $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admins');
    }
};
