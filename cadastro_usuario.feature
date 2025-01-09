Feature: Cadastro da Pessoa Usuária

  # Descreve o objetivo geral da funcionalidade.
  Quero me cadastrar no sistema,
  Quero salvar os dados no banco de dados,
  Para poder buscar profissionais e acessar os serviços disponíveis.

  Background: Pré-condições
    # Pré-condições que se aplicam a todos os cenários desta feature.
    Given que o sistema está disponível
    And que a pessoa usuária está na página de cadastro

  Scenario: Realizar cadastro com sucesso
    Given que a pessoa usuária preenche os campos obrigatórios:
      | Nome      | E-mail                | Senha    |
      | João Silva| joao.silva@email.com  | senha123 |
    When clica no botão "Cadastrar"
    Then o sistema exibe a mensagem "Cadastro realizado com sucesso"
    And a pessoa usuária é redirecionada para a página de boas-vindas

  Scenario: Realizar login após cadastro
    Given que a pessoa usuária já está cadastrada com o e-mail "joao.silva@email.com"
    When a pessoa insere suas credenciais:
      | E-mail                | Senha    |
      | joao.silva@email.com  | senha123 |
    And clica no botão "Entrar"
    Then o sistema exibe a mensagem "Login realizado com sucesso"
    And a pessoa usuária é redirecionada para o painel principal

  Scenario: Buscar profissional após login
    Given que a pessoa usuária está autenticada no sistema
    When a pessoa insere o termo "Desenvolvedor" no campo de busca
    And clica no botão "Buscar"
    Then o sistema exibe uma lista de profissionais com a especialidade "Desenvolvedor"
    And a pessoa pode visualizar detalhes do profissional ao clicar em "Ver Perfil"
