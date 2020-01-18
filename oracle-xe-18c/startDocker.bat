:: https://github.com/fuzziebrain/docker-oracle-xe
docker run -d ^
  -p 11521:1521 ^
  -p 15500:5500 ^
  --name=oracle-xe ^
  --volume /D_DRIVE/Projects/ACCS/db/oradata-xe:/opt/oracle/oradata ^
  oracle-xe:18c

::  --network=oracle_network ^
:: docker logs oracle-xe
