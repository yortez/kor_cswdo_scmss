<?php

namespace App\Policies;

use App\Models\User;
use App\Models\MasterList;
use Illuminate\Auth\Access\HandlesAuthorization;

class MasterListPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->can('view_any_master::list');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, MasterList $masterList): bool
    {
        return $user->can('view_master::list');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->can('create_master::list');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, MasterList $masterList): bool
    {
        return $user->can('update_master::list');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, MasterList $masterList): bool
    {
        return $user->can('delete_master::list');
    }

    /**
     * Determine whether the user can bulk delete.
     */
    public function deleteAny(User $user): bool
    {
        return $user->can('delete_any_master::list');
    }

    /**
     * Determine whether the user can permanently delete.
     */
    public function forceDelete(User $user, MasterList $masterList): bool
    {
        return $user->can('force_delete_master::list');
    }

    /**
     * Determine whether the user can permanently bulk delete.
     */
    public function forceDeleteAny(User $user): bool
    {
        return $user->can('force_delete_any_master::list');
    }

    /**
     * Determine whether the user can restore.
     */
    public function restore(User $user, MasterList $masterList): bool
    {
        return $user->can('restore_master::list');
    }

    /**
     * Determine whether the user can bulk restore.
     */
    public function restoreAny(User $user): bool
    {
        return $user->can('restore_any_master::list');
    }

    /**
     * Determine whether the user can replicate.
     */
    public function replicate(User $user, MasterList $masterList): bool
    {
        return $user->can('replicate_master::list');
    }

    /**
     * Determine whether the user can reorder.
     */
    public function reorder(User $user): bool
    {
        return $user->can('reorder_master::list');
    }
}
