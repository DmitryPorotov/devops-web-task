---

Author: Dmitry Porotov

---

# Setup
Setup script creates "webdeploy" user, creates website directory. It sould be run only one time.

# Deploy
Deploy script copies files from the site directory to the website directory. It reloads nginx config after this.

# Backup
Backup script copies files from the website directory to a datetime directory inside the backup directory. If there are more then 5 backup directories then the oldest directories are zipped.

# Rollback
Rollback script copies the files from the last backup directory to the website directory.