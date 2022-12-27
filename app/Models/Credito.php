<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Credito extends Model {
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'Crediti';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'IDCredito';

    // Disable timestamps
    public $timestamps = false;
}
