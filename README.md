# dio.database.experience
Repositório criado para estudo do bootcamp Database Experience da DIO

Links Úteis:

## Links Úteis

[Ferramentas free para designer de Banco de Dados]


[DB Designer]
(https://app.dbdesigner.net/)

[Draw.io]
https://app.diagrams.net/

## DESAFIOS DE PROJETO
[Refinando um Projeto Conceitual de Banco de Dados – E-COMMERCE]


Dadas as narrativas abaixo, o Expert criou um modelo conceitual "inicial".

Narrativa - Produto:

- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos;
- Cada produto possui um fornecedor;
- Um ou mais produtos podem compor um pedido.


Narrativa - Cliente:

- O cliente pode se cadastrar no site com seu CPF ou CNPJ;
- O endereço do cliente irá determinar o valor do frete;
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

Narrativa - Pedido:

- Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;
- Um produto ou mais compoem o pedido;
- O pedido pode ser cancelado;

A partir do modelo criado, foram sugeridos, como desafio, os seguintes refinamentos:

- Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento - Pode ter cadastrada mais de uma forma de pagamento;
- Entrega - Possui status e código de rastreio.

Dado um cenário para venda de produtos em um comérico eletrônico, foi elaborado pelo Expert um modelo conceitual para que os dados referentes a comercialização desses produtos pudessem ser armazenados.
Neste modelo foram criadas algumas entidades como: Cliente, Produto, Estoque, Pedido, Fornecedor, TerceiroVendedor, entre outras e foi sugerido o seguinte refinamento:


[O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados]

- Banco de Dados SQL x NoSQL:

Bancos de dados Relacionais são bancos de dados estruturados e com schema (organização dos dados) bem definido; 
o schema é definido e criado antes do armazenamento dos dados. Nos Bancos de Dados relacionais os dados são armazenados em tabelas relacionadas entre si. 
Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa utilizada para manipular os dados em um banco de dados relacional.

Os Bancos de dados não relacionais surgiram para "somar" e não para substituir os Bancos de Dados Relacionais.
Eles permitem que os dados sejam manipulado de forma menos rígida que nos Bancos de Dados Relacionais. Bancos de Dados não Relacionais (NoSQL) partem do princípio que os dados podem ser semi ou não estruturados 
outros tipos de relacionamentos podem existir entre os dados e podem ser armazenados de várias formas (pode ser orientado a coluna, orientado a documento, baseado em grafos ou organizado como chave-valor).

- Data Lake:

Um Data Lake é um repositório centralizado que permite armazenar todos os dados estruturados 
e não estruturados em qualquer escala. Podemos armazenar os dados como estão na fonte, sem ter que primeiro estruturá-los
e executar diferentes tipos de análises.

O principal desafio de uma arquitetura Data Lake é que os dados brutos são armazenados sem supervisão de conteúdo. 
Para que um data lake torne os dados utilizáveis, ele precisa ter mecanismos definidos para catalogar e proteger dados.
Sem esses elementos, os dados não podem ser encontrados ou confiáveis, resultando em um "Pântano de Dados" (Data Swamp).


- Engenheiro de Dados X Arquiteto de Dados X Cientistas de Dados:

Um Engenheiro de dados é responsável por criar pipelines de dados, manter e construir sistemas de armazenamento
de dados que serão utilizados por outras áreas da empresa; este profissional está mais ligado a preparação da informação com a utilização de ferramentas técnicas.
Data Warehouses e Data Lakes são exemplos de tais estruturas que podem ser consumidas por analistas e cientistas de dados.
A principal diferença entre um Engenheiro de Dados e um Cientista de Dados é que o segundo é alguém que limpa, organiza e examina Big Data.

O arquiteto de dados é responsável por estruturar informações que têm algum tipo de relação para, assim, 
organizar sites, intranets e outros portais digitais. O profissional considera, entre outros pontos, 
a usabilidade dessas ferramentas, facilitando o acesso dos usuários aos conteúdos.











  


