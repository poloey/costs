<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
  protected $guarded = [];
  public function category() {
    return $this->belongsTo(Category::class);
  }
   public function scopeFilter($query, $filters) {
      if (isset($filters['category'])) {
        $query->where('category_id', $filters['category']);
      }
      // if($month = $filters['month']) {
      //     $query->whereMonth('created_at', Carbon::parse($month)->month);
      // }
      // if ($year = $filters['year']) {
      //     $query->whereYear('created_at', Carbon::parse($year)->year);
      // }
      // $label = $filters['label'];
      // if(!$this->is_string_contain_null($label)) {
      //   $query->whereHas('labels', function($r) use($label) {
      //       $r->where('name','=', $label);
      //   });
      // }
      // if($filters['type'] != 'all') {
      //   $query->where('posttype', $filters['type']);
      // }
      // if(!$this->is_string_contain_null($filters['postUserId'])) {
      //   $query->where('user_id', $filters['postUserId']);
      // }
      // if(!$this->is_string_contain_null($filters['startDate'])) {
      //   $query->where('created_at', '>=',  $filters['startDate']);
      // }
      // if(!$this->is_string_contain_null($filters['endDate'])) {
      //   $query->where('created_at', '<=',  $filters['endDate']);
      // }
  }
}
