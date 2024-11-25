-- 1 A empresa de tecnologia TINEWTON precisa de um DBA para fazer a gestão de Controle de seus usuários.
-- Está um caos o controle de acessos, muitos colaboradores acessando o sistema sem senha e etc.....
-- Para ajudar você o desenvolvedor já fez o mapeamento dos usuarios e você terá apenas que entregar pronto:
# Primeiro vamos usar alguns comandos para entender como estão configurados os usuarios.
-- Comando 1 - Liste o usuário que está logado no sistema.

SELECT CURRENT_USER();

-- Comando 2 - Liste os usuarios e seu host.

SELECT USER FROM MYSQL.USER;

-- Comando 3 - Liste os usuários e todos seus privilégios

SELECT * FROM MYSQL.USER;

-- Depois dessa primeira tarefa, vamos ajustar o controle para a nova gestão.
-- Você deverá apagar todos usuarios do sistema, somente os usuários abaixo listados devem continuar:
# usuarios que devem ficar : 'root', 'mysql.infoschema','mysql.session','mysql.sys'.

DROP USER 'NOME1'@'localhost';
DROP USER 'NOME2'@'localhost';

# Comando 4 - Apague os usuarios usando o comando DROP USER 'nome_usuario'@'servidor';
-- Agora teremos apenas os usuarios do sistema cadastrados, então podemos começar a cadastrar os colaboradores.
-- 2 Crie os seguintes usuarios:
#Local-- JoanaASCII - 123321
CREATE USER 'JoanaASCII'@'LOCALHOST' IDENTIFIED BY '123321';

#local-- KarenMouse - sem senha
CREATE USER 'KarenMouse'@'LOCALHOST';

#remoto-- TioTeclas - 131312
CREATE USER 'TioTeclas'@'%' IDENTIFIED BY '131312';

#remoto-- Teclaudio - 369099
CREATE USER 'Teclaudio'@'%' IDENTIFIED BY '369099';

#local-- RonanAsus - sem senha
CREATE USER 'RonanAsus'@'LOCALHOST';

#local-- MarcusTeras - 451212
CREATE USER 'MarcusTeras'@'LOCALHOST' IDENTIFIED BY '451212';

-- 3 Depois de criados surgiram de ultima hora algumas alterações que devem ser feitas:

# A usuaria KarenMouse deve receber a senha padrão 123456
ALTER USER 'KarenMouse'@'localhost' IDENTIFIED BY '123456'; 

# O usuario TioTeclas deve ter a senha alterada para 202020
ALTER USER 'TioTeclas'@'%' IDENTIFIED BY '202020';

# O usuario RonanAsus deve receber a senha padrão 123456
ALTER USER 'RonanAsus'@'LOCALHOST' IDENTIFIED BY '123456';

-- 4 Algumas alterações no password de alguns usuarios devem ser realizadas:
# A usuaria KarenMouse deve receber a senha 121212 que nunca expira
ALTER USER 'KarenMouse'@'localhost' IDENTIFIED BY '121212' PASSWORD EXPIRE NEVER; 

# O usuario TioTeclas deve receber a 1234 que expira em 90 dias
ALTER USER 'TioTeclas'@'%' IDENTIFIED BY '1234' PASSWORD EXPIRE INTERVAL 90 DAY;

# O usuario RonanAsus deve receber a senha R232323, mas o sistema deve exigir que se digite a senha atual antes
ALTER USER 'RonanAsus'@'LOCALHOST' IDENTIFIED BY 'R232323' PASSWORD REQUIRE CURRENT;

# O usuario Teclaudio deve receber deve receber um novo padrão de uso, onde deve-se inserir um historico
-- de utilização de senha onde não se pode usar a mesma senha antes de alterá- la 3 vezes com senhas diferentes
ALTER USER 'Teclaudio'@'%' IDENTIFIED BY '369099' PASSWORD HISTORY 3;
