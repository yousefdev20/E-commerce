<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSaleBoxesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sale_boxes', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('payment_id')->nullable()->default(0);
			$table->integer('order_id');
			$table->string('payment_way');
			$table->timestamps();
			$table->integer('driver_id');
			$table->integer('coupon_id')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('sale_boxes');
	}

}
