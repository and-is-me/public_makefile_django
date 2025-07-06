# Repo for copypasta .gitignore to projects

copy and paste command in terminal 

via ssh
```
git fetch git@github.com:and-is-me/public_makefile_django.git main:public_makefile_django
git checkout public_makefile_django -- project.mk
mv  "project.mk" "Makefile"
got add Makefile
git commit -m "grabbed project.mk->Makefile from public_makefile_django repo"
git push
```

via https
```
git fetch https://github.com/and-is-me/public_makefile_django.git main:public_makefile_django
git checkout public_makefile_django -- project.mk
mv  "project.mk" "Makefile"
got add Makefile
git commit -m "grabbed project.mk->Makefile from public_makefile_django repo"
git push
```

git remote add gitlab git@gitlab.com:and_me_group_submodules/public_makefile_django.git
git remote add github git@github.com:and-is-me/public_makefile_django.git
git push -uf origin main
git push -uf gitlab main