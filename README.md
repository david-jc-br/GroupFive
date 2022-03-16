## Logística de Vendas
## Descrição:
Levantamento de dados para uma empresa de tecnologia, denominada GroupFive, que oferece 
soluções de comércio eletrônico para pessoas físicas e jurídicas, sendo possível comprar, vender 
e enviar produtos.
A logística da empresa funciona com o cadastro de uma pessoa, que pode ser um cliente
e/ou um funcionário de uma loja parceira, para uma pessoa é importante armazenar os atributos 
CPF, nome e endereço.
O cliente cadastrado pode solicitar um pedido de um produto fornecido por determinada 
loja, a quantidade do produto é estabelecida apenas quando o usuário faz o pedido, por isso o 
atributo quantidade é armazenado na relação entre pedido e produto.
Para o pedido, é importante saber o número do pedido; para a loja, o seu CNPJ; e para 
o produto, o seu código. Cada funcionário cadastrado está relacionado a somente uma loja,
contudo uma loja parceira pode ter mais de um funcionário. Sempre que a GroupFive cadastrar 
um pedido, sua entrega vai ser controlada pela loja que o proveu. Cada entrega é referente a 
apenas um pedido, portanto é importante armazenar o ID da entrega. Um funcionário da 
empresa parceira pode pertencer à subclasse motorista, o qual será motorista de um veículo que 
será utilizado na entrega de um pedido. Na loja, o veículo utilizado na entrega é sempre um 
caminhão ou uma moto. É importante saber a placa do veículo para sua identificação na entrega 
do pedido.

![modeloRelacional](https://user-images.githubusercontent.com/73839667/158701094-44a8fd59-e3cc-44f8-9325-d54583dbc620.png)
