<?php

namespace App;

use Carbon\Carbon;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
  protected $guarded = [];
  public function user()
  {
    return $this->belongsTo(User::class);
  }
  public function category() {
    return $this->belongsTo(Category::class);
  }
   public function scopeFilter($query, $filters) {
      if (isset($filters['category'])) {
        $query->where('category_id', $filters['category']);
      }

      if (isset($filters['query'])) {
        $query->where('name', 'like',  "%{$filters['query']}%")
        ->orWhere('description', 'like',  "%{$filters['query']}%");
      }


      if (isset($filters['start']) && isset($filters['end']) && !empty($filters['start']) && !empty($filters['end'])  ) {
        $start = Carbon::parse($filters['start'])->toDateString();
        $end = Carbon::parse($filters['end'])->toDateString();
        $query->whereBetween('created_at', [$start, $end]);
      } else if (isset($filters['start']) && !empty($filters['start'])  ) {
        $start = Carbon::parse($filters['start'])->toDateString();
        $query->where('created_at', '>=', $start);
      } else if (isset($filters['end']) && !empty($filters['start'])  ) {
        $end = Carbon::parse($filters['end'])->toDateString();
        $query->where('created_at', '<=', $end);
      }
  }
}
