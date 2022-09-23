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


Dadas as narrativas abaixo, o Expert criou um modelo conceitual tenco como "entidades principais": Cliente, Produto, Estoque, Pedido, Fornecedor e TerceiroVendedor.

Narrativa - Produto:

- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos;
- Cada produto possui um fornecedor;
- Um ou mais produtos podem compor um pedido.


Narrativa - Cliente:

- O cliente pode se cadastrar no site com seu CPF oou CNPJ;
- O endereço do cliente irá determinar o valor do frete;
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

Narrativa - Pedido:

- Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;
- Um produto ou mais compoem o pedido;
- O pedido pode ser cancelado;

A partir do modelo criado, foram sugeridos, como desafio, os seguintes refinamentos no modelo:

- Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento - Pode ter cadastrada mais de uma forma de pagamento;
- Entrega - Possui status e código de rastreio.



Dado um cenário para venda de produtos em um comérico eletrônico, foi elaborado pelo Expert um modelo conceitual para que os dados referentes a comercialização desses produtos pudessem ser armazenados.
Neste modelo foram criadas algumas entidades como: Cliente, Produto, Estoque, Pedido, Fornecedor, TerceiroVendedor, entre outras e foi sugerido o seguinte refinamento:

  


