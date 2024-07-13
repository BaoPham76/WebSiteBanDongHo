<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('name');
            $table->string('phone_number');
            $table->string('city');
            $table->string('district');
            $table->string('ward');
            $table->string('apartment_number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            // Drop columns if needed during rollback
            $table->dropColumn('name');
            $table->dropColumn('phone_number');
            $table->dropColumn('city');
            $table->dropColumn('district');
            $table->dropColumn('ward');
            $table->dropColumn('apartment_number');

        });
    }
};
