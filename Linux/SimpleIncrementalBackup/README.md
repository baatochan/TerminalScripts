# Simple Incremental Backup
Simple Incremental Backup using `tar` and `cron`.

It performs incremental backup over all `/home` directories (in a way `/home/group/user`). It uses very simple `tar` command and is recurrently turned on using `cron`.

To restore data recreate user dir, go to `/home` and go over all files with this command:
```
tar -xg /dev/null -f /backup/produkcja/kowalskij/data.tar
tar -xg /dev/null -f /backup/produkcja/kowalskij/1610069582.tar
```

More info in Polish in University Stuff repo in report from Administracja Systemów Sieciowych from Linux, lab 3 (the end of the report).
