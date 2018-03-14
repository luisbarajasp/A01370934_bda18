// Primero se crea un nuevo container en docker para que sea slave

CREATE USER slave@'%' IDENTIFIED BY 'mypassword';
GRANT SELECT, PROCESS, FILE, SUPER, REPLICATION CLIENT, REPLICATION SLAVE, RELOAD ON *.* TO slave@'%';
Flush Privileges; 
CHANGE MASTER TO
MASTER_USER='slave',
MASTER_PASSWORD='mypassword';
START slave;
show slave status;
