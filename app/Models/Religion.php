<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Religion extends Model
{
    public function senior_citizens()
    {
        return $this->hasMany(MasterList::class);
    }

    // add fillable
    protected $fillable = [
        'id',
        'name',
        'description',
    ];
    // add guaded
    protected $guarded = ['id'];
    // add hidden
    protected $hidden = ['created_at', 'updated_at'];
}
