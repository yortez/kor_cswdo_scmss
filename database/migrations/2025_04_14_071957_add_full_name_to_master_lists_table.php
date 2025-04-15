<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\MasterList;

class AddFullNameToMasterListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('master_lists', function (Blueprint $table) {
            $table->string('full_name')->nullable();
        });

        // Update full_name for existing records
        MasterList::all()->each(function ($masterList) {
            $masterList->full_name = trim($masterList->last_name . ', ' . $masterList->first_name . ' ' . $masterList->extension);
            $masterList->save();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('master_lists', function (Blueprint $table) {
            $table->dropColumn('full_name');
        });
    }
}
