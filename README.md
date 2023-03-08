# gpdb-6.23-docker

1. docker compose up

2. 
  docker compose exec -ti gpdb-primary-cluster bash
  /home/gpadmin/script.sh
  
3. 
  docker compose exec -ti gpdb-disaster-recovery-cluster bash
  /home/gpadmin/script.sh
 
 4. On DR container, run:
    gpcr info
    gpcr restore --restore-point **** 
    gpstart -qa 
    psql demo
    
 
  
