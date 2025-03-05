<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('master_lists', function (Blueprint $table) {
            $table->id();
            $table->integer('osca_id');
            $table->string('last_name');
            $table->string('first_name');
            $table->string('middle_name');
            $table->string('extension')->nullable();
            $table->date('birthday');
            $table->integer('age');
            $table->string('gender');
            $table->string('civil_status');
            $table->string('religion_id')
                ->constrained('religions')
                ->cascadeOnDelete();;
            $table->string('birth_place');
            $table->foreignId('city_id')
                ->constrained('cities')
                ->cascadeOnDelete();
            $table->foreignId('barangay_id')
                ->constrained('barangays')
                ->cascadeOnDelete();
            $table->foreignId('purok_id')
                ->constrained('puroks')
                ->cascadeOnDelete();
            $table->string('gsis_id')
                ->nullable()
                ->default("N/A");
            $table->string('philhealth_id')
                ->nullable()
                ->default("N/A");
            $table->string('illness')
                ->nullable()
                ->default("N/A");
            $table->string('disability')
                ->nullable()
                ->default("N/A");
            $table->string('educational_attainment');
            $table->date('date_of_registration');
            $table->boolean('is_active')
                ->default(true);
            $table->text('registry_number')
                ->nullable();
            $table->date('date_of_death')
                ->nullable();
            $table->text('remarks')
                ->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('master_lists');
    }
};
