# Universidade Estadual de Campinas
# Instituto da Computação

## Disciplina: MC855-2s2022

#### Professor e Assistente

| Nome                     | Email                   |
| ------------------------ | ------------------------|
| Professora Juliana Borin | jufborin@unicamp.br     |
| Assistente Paulo Kussler | paulo.kussler@gmail.com |


#### Equipe

| Nome             | RA     | Email                  | ID Git          |
| ---------------- | ------ | ---------------------- | --------------- |
| Gabriel Silveira | 197244 | g197244@dac.unicamp.br | Gabomfim        |
| Gustavo Praciano | 217555 | g217555@dac.unicamp.br | gustavopb05     |
| Ricardo Pavan    | 176722 | r176722@dac.unicamp.br | ricardohpavan   |
| Santiago Saraiva | 205720 | s205720@dac.unicamp.br | SantiagoSaraiva |
| Vinicius Dantas  | 188092 | v188092@dac.unicamp.br | vinidantas98    |

### Descrição do projeto:
O projeto é uma aplicação em Flutter com objetivo de simplificar a tarefa de atualizar os dados de itens de um inventário, dispostos no formato de uma planilha de Excel.

No aplicativo é possível, ao entrar com o ID de um item, confirmar se o mesmo se encontra no local correto e, caso não esteja, atualizar o item com o novo local. A qualquer momento também é possível ver um sumário com todos os itens e suas informações de local.

#### Prints das telas com descrição das funcionalidades. 
Tela inicial onde é necessário que o usuário faça o upload de uma planiha válida:

![home](/prints/home.jpeg)

Tela para a busca de um item:

![busca](/prints/busca.jpeg)

Caso o item tenha sido encontrado, será exibida suas informações:

![pesquisa](/prints/pesquisa.jpeg)

Caso o item esteja em um local incorreto, o usuário terá a opção de o mover:

![local_incorreto](/prints/local_incorreto.jpeg)

Telas do sumário dos itens escaneados e não escaneados:

![sumario](/prints/sumario.jpeg)

![sumario_alterado](/prints/sumario_alterado.jpeg)

#### Tecnologias, ferramentas, dependências, versões. etc. 
Para o front-end foi usado o *Flutter* (3.3.7), com o auxílio das bibliotecas *HTTP* (0.13.5) e *File Picker* (5.5.2).

O back-end foi executado utilizando *Python* (3.9.7) com a biblioteca *Pandas* para o processamento da planilha e conversão para um banco de dados.

A API escolhida para a comunicação entre os dois foi a *FastAPI* (3.0.2).

#### Ambientes
Os ambientes utilizados foram:
- *VSCode* para o front-end do Flutter (necessário instalar extensão específica para compatibilidade com o Flutter);
- *PyCharm* para o back-end com Python.

Vale ressaltar que devem ser baixado as dependências. No PyCharm pode ser usado o comando:
```
pip intall -r requeriments.txt
```

No caso do VSCode a extensão do Flutter deve pedir para instalar automaticamente, quem estiver fazendo a build só precisará confirmar.

Para o gerenciamento e versionamento do código foi usado o GitHub e um quadro de tarefas foi criado no Trello.


#### Como colocar no ar, como testar, etc
Para a execução do programa, é recomendado utilizar o mesmo método que foi utilizado para a criação do projeto, sendo todos os terminais através do Git Bash.

Para iniciar o servidor local do back-end, é necessário executar o seguinte comando no arquivo main, dentro do PyCharm:
```
uvicorn main:app --reload
```

Para iniciar a aplicação no Flutter, basta selecionar o modo para o simulador como "chrome" e executar o arquivo "main.dart" através do atalho F5.

Feito isso, o programa deverá rodar como previsto.

#### Como acessar, quem pode se cadastrar(regras de acessos), etc.
O projeto não possui nenhuma restrição de acesso, sendo somente necessária uma planilha do Excel com os campos utilizados para as informações de cada item.

Esses campos, e suas definições, são:
- Para a identificação do item:
	- "Identificador" : Um número.
	- "PI Antigo" : Uma sequência de letras e números; identificador antigo.
	- "Descrição" : Descrição do item.
- Para a localização do item:
	- "Área de Patrimônio" : Instituto/Faculdade responsável pelo item.
	- "Desc. Órgão" : Subdivisão do instituto/faculdade responsável.
	- "Imóvel" : Construção onde o item se localiza.
	- "Local N1" : Maior nível de localização; geralmente um andar.
	- "Local N2" : Segundo nível de localização; geralmente uma sala.
	- "Local N3" : Terceiro nível de localização; geralmente um usuário do item.
	- "Local N4" : Quarto nível de localização.
	- "Local N5" : Menor nível de localização.

Para futuros trabalhos com esse projeto é importante priorizar o tópico de segurança e restrições, visto que este foi mais focado em um MVP. 
