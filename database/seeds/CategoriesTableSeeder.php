<?php

use Illuminate\Database\Seeder;
use App\Category;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      foreach (['purchase', 'due'] as $name) {
        Category::create([
          'name' => $name
        ]);
      }
    }
}
