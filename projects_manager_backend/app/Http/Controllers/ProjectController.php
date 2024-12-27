<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;

/**
 * @group Projects
 */
class ProjectController extends Controller
{
    /**
     * Get all projects
     */
    public function index () {
        return Project::all() ;
    }

    /**
     * Get specific project
     */
    public function show(Project $project) {
        return $project ;
    }


}
