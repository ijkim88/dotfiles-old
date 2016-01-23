Git
===

Configure Git
-------------

.. code-block:: shell

   $ git config --global user.name "John Doe"
   $ git config --global user.email "johndoe@example.com"
   $ git config --global color.ui true


If Having Trouble Pushing to GitHub
-----------------------------------

.. code-block:: shell

   $ git remote set-url origin https://username@github.com/user/repo.git
   $ unset SSH_ASKPASS
   $ git push origin master


Remove a bad commit on Git
--------------------------

.. code-block:: shell

   $ git reset --soft HEAD^
   $ git push origin +master


Fixing author remails for commits
---------------------------------

This will change all of the authors to the new author

.. code-block:: shell

   $ git clone --bare https://github.com/user/repo.git
   $ cd repo.git

Run ``git-author-rewrite.sh`` in scripts folder and verify by running 

.. code-block:: shell

  $ git log | grep Author | sort | uniq

Finally push using

.. code-block:: shell

   $ git remote add origin https://username@github.com/user/repo.git
   $ git push --force --tags origin refs/heads/*


Install a new submodule
-----------------------

.. code-block:: shell

   $ git submodule add [git repository url]
   $ git add [files or '.' for all]
   $ git commit -m "[comment]"
   $ git push


Removing a submodule
--------------------

.. code-block:: shell

   $ git submodule deinit [path]
   $ git rm [path]
   $ git commit -m "[comment]"
   $ git push


Initializing all submodules
---------------------------

.. code-block:: shell

   $ git submodule update --init


Updating a submodule
--------------------

Go to the directory of the git module to update

.. code-block:: shell

   $ git pull origin master


Updating all submodules
-----------------------

.. code-block:: shell

   $ git submodule foreach git pull origin master


push.default Matching vs. Simple
--------------------------------

``git push`` can push all branches or a single one dependent on this configuration.

**Matching** will push all the branches to the remote branch and would merge them. If you don't want to push all branches, you can push the current branch only::

   $ git config --global push.default matching

So, it's better to use **Simple** and push your code branch by branch. It's better to push branches manually and individually::

   $ git config --global push.default simple


Setup a remote repository for Git
---------------------------------

First setup the remote repository

.. code-block:: shell

   $ ssh git@example.com
   $ mkdir my_project.git
   $ cd my_project.git
   $ git init --bare
   $ git update-server-info # If planning to serve via HTTP
   exit

On the local machine

.. code-block:: shell

   $ cd my_project
   $ git init
   $ git add .
   $ git commit -m "Commit message"
   $ git remote add origin git@example.com:my_project.git
   $ git push -u origin master
