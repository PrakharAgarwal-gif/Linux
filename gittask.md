mkdir loginsystem
cd loginsystem
parija@parisUbuntu:~/loginsystem$ git init

git checkout -b feature/login-system

#make all the required  commits 

git log 
commit d8b107deea522aada76789d5bbcf6cc3660f6890 (HEAD -> master)
Author: parija <parija.sharma16@gmail.com>
Date:   Mon Sep 29 09:25:44 2025 +0530

    E: Minor bug fix and styling tweaks

commit fee55ec255536b9f2467fbd67c2c3117f5d1ce77
Author: parija <parija.sharma16@gmail.com>
Date:   Mon Sep 29 09:24:33 2025 +0530

    D: Added form validation and error handling

commit 4abb4e231591442edb119df4746f944d775a9881
Author: parija <parija.sharma16@gmail.com>
Date:   Mon Sep 29 09:21:40 2025 +0530

    C: Implemented backend API integration

commit b13ef693c442b69be5b939871e0e54892bcf8f64
Author: parija <parija.sharma16@gmail.com>
Date:   Mon Sep 29 09:18:00 2025 +0530

    B: Added UI components for login

commit d6194a9e82c2509ec87f05ff792e371f60aed967
Author: parija <parija.sharma16@gmail.com>
Date:   Mon Sep 29 09:15:46 2025 +0530

    A: Base feature setup and project scaffolding
    
1.
git revert 886573ecf8e09a8eb4f137f20197a1e8eaf8a89d

2.
git reset --soft HEAD~1

3.
git reset --mixed af205b888148df89d9e6a6455ff70dff39b7ba5d

4.
git reset --hard af205b888148df89d9e6a6455ff70dff39b7ba5d


git status
On branch feature/login-system
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	api/
	api_login.html
	ui/styling.css

nothing added to commit but untracked files present (use "git add" to track)



