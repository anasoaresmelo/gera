//
//  TermsConditionsView.swift
//  Gera
//
//  Created by Beatrix Lee on 04/03/21.
//

import SwiftUI

struct TermsConditionsView: View {
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Termos e Condições")
                        .font(.system(size: 36, weight: .bold, design: .default))
                        .foregroundColor(Color(.systemPurple))
                        .padding()
                    
                    Text("1. Aceitando os termos")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Text("Ao acessar ou utilizar o Serviço, você está concordando com todos os termos abaixo. Caso você não concorde com os termos abaixo, não poderá utilizar o Serviço. Quaisquer dúvidas acerca desses Termos podem ser dirimidas através do e-mail gera@riso.dev.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("2. Alterações nos termos")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Text("Sempre que fazemos alterações nestes Termos, as alterações são efetivas em 7 dias após postarmos tais Termos revisados (ixndicados pela revisão da data no topo destes Termos) ou após sua aceitação se fornecermos um mecanismo para sua aceitação imediata dos Termos revisados (como um botão de confirmação dentro do Serviço). É sua responsabilidade verificar por alterações nos Termos. Nos reservamos ao direito de alterar estes termos a qualquer momento. Por exemplo, podemos alterar estes termos para refletir mudanças no Serviço, como uma nova funcionalidade, ou por qualquer outra razão.Se você continuar a usar o Serviço a partir da data de efetividade dos Termos revisados, então você aceita as alterações nestes Termos.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("3. Política de Privacidade")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Text("Para obter informações sobre como coletamos e usamos informações sobre as pessoas usuários do Serviço, confira nossa política de privacidade disponível em")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("4. Serviços de terceiros")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Text("Dentro do Serviço podemos fornecer-lhe links para sites ou serviços de terceiros que não possuímos ou controlamos. O uso do Serviço também pode incluir o uso de aplicativos desenvolvidos ou de propriedade de terceiros (como o Apple Wallet). O uso de tais aplicativos, sites e serviços de terceiros é regido pelos próprios termos de serviço ou políticas de privacidade desse serviço. Nós encorajamos você a ler os termos e condições e política de privacidade de qualquer aplicativo, site ou serviço de terceiros que você visite ou use.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                }
                
                Group {
                    
                    Text("5. Seu conteúdo e conduta")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    
                    Text("Nosso Serviço permite que você e outros usuários publiquem, vinculem e disponibilizem conteúdo. Você é responsável pelo conteúdo que disponibiliza ao Serviço, incluindo sua legalidade, confiabilidade e adequação.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    Text("Você é responsável pelos dados fornecidos ao Serviço, incluindo, mas não se limitando, os dados de pagamento, dados financeiros e dados pessoais. O Serviço não se responsabiliza nem assegura o pagamento, liquidação, correção monetária e/ou quaisquer operações financeiras, relacionadas ao conteúdo criado, tão somente atuando como ferramenta para criação do conteúdo. O Serviço não é um banco, uma empresa de pagamentos nem responsável por quaisquer operações financeiras. Ao compartilhar o conteúdo do Serviço para terceiros, você está expressamente compartilhando também os dados, incluindo, mas não se limitando, os dados de pagamento, dados financeiros e dados pessoais incluídos no conteúdo. O Serviço não se responsabiliza pelo uso dos dados compartilhados com terceiros.")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Text("Quando você posta, vincula ou disponibiliza conteúdo para o Serviço, você nos concede o direito e a licença de usar, reproduzir, modificar, executar publicamente, exibir e distribuir publicamente seu conteúdo ou através do Serviço. Podemos formatar seu conteúdo para exibição em todo o Serviço, mas não vamos editar ou revisar a substância do seu conteúdo em si.\nAlém do nosso direito limitado ao seu conteúdo, você retém todos os seus direitos ao conteúdo que posta, \nvincula seu link e disponibiliza através do Serviço. \nVocê pode remover o conteúdo que postou excluindo-o. Uma vez que você exclua seu conteúdo, ele não aparecerá no Serviço, mas cópias do conteúdo excluído podem permanecer em nosso sistema ou backups por algum período de tempo. Reteremos dados ao servidor web por um período máximo de 30 dias e, em seguida, os excluiremos.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("Você não pode postar, vincular e disponibilizar no serviço ou através do Serviço qualquer um dos seguintes:")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("- Conteúdo calunioso, difamatório, preconceituoso, fraudulento ou enganoso;\n- Conteúdo ilegal, que de outra forma criaria responsabilidade;\n- Conteúdo que possa infringir ou violar qualquer patente, marca registrada, segredo comercial, direitos autorais, direito de privacidade, direito de publicidade, outro direito intelectual ou outro direito de qualquer parte;\n- Promoções em massa ou repetidas, campanhas políticas ou mensagens comerciais direcionadas a usuários que não o seguem (SPAM);\n- Informações privadas de terceiros (por exemplo, endereços, números de telefone, endereços de e-mail, documentos de identificação e dados financeiros); \n- Vírus, dados corrompidos, outros arquivos ou códigos prejudiciais, disruptivos ou destrutivos.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("Além disso, você concorda que não fará nada disso em conexão com o Serviço ou outros usuários:")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("- Usar o Serviço de qualquer maneira que possa interferir, interromper, afetar negativamente ou inibir outros usuários de desfrutar plenamente do Serviço ou que possam danificar, desabilitar, sobrecarregar ou prejudicar o funcionamento do Serviço;\n- Personificar ou postar em nome de qualquer pessoa ou entidade ou deturpar sua afiliação com uma pessoa ou entidade;\n- Coletar quaisquer informações pessoais sobre outros usuários, ou intimidar, ameaçar, perseguir ou assediar outros usuários do Serviço;\n- Criar uma conta ou publicar qualquer conteúdo se você não tiver mais de 13 anos de idade; \n- Esvair ou tentar contornar qualquer filtragem, medidas de segurança, limites de tarifa ou outros recursos projetados para proteger o Serviço, usuários do Serviço ou terceiros.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                    
                    Text("6. Materiais do Gera")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding()
                    
                    Group{
                        
                        Text("Nós nos esforçamos muito na criação do Serviço, incluindo o logotipo e todos os designs, texto, gráficos, imagens, informações e outros conteúdos (excluindo o conteúdo gerado por você). Este conteúdo é de propriedade nossa ou de nossos licenciadores e é protegida pelas leis de direitos autorais. Nós lhe concedemos o direito de usá-lo.\n\nNo entanto, a menos que informemos expressamente o contrário, seus direitos não incluem: (i) exibir publicamente o Serviço; (ii) modificar ou fazer qualquer uso derivativo do Serviço ou qualquer parte do mesmo; (iii) utilizar qualquer mineração de dados, robôs ou métodos similares de coleta ou extração de dados; (iv) engenharia reversa ou acesso ao Serviço para construir um produto ou serviço competitivo; ou (v) usar o Serviço diferente dos seus propósitos. Se você fizer qualquer um desses trabalhos, podemos terminar o seu uso do Serviço.")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding()
                        
                        
                        Text("7. Hiperlinks e conteúdo de terceiros")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .padding()
                        
                        Text("Você pode criar um hiperlink para o Serviço. Entretanto, você não pode usar, enquadrar ou utilizar técnicas de enquadramento para incluir qualquer uma de nossas marcas comerciais, logotipos ou outras informações proprietárias sem o nosso consentimento expresso por escrito. \n\nAs pessoas desenvolvedoras do Gera não fazem nenhuma reclamação ou representação sobre, e não aceitam nenhuma responsabilidade por sites de terceiros acessíveis pelo hiperlink do Serviço ou sites vinculados ao Serviço. Quando você deixa o Serviço, você deve estar ciente de que estes Termos e nossas políticas não governam mais.\n\nSe houver algum conteúdo sobre o Serviço de você e outros, não revisamos, verificamos ou autenticamos, e ele pode incluir imprecisões ou informações falsas. Não fazemos representações, garantias ou garantias relacionadas à qualidade, adequação, verdade, exatidão ou completude de qualquer conteúdo contido no Serviço. Você reconhece a responsabilidade exclusiva e assume todos os riscos decorrentes do uso ou dependência de qualquer conteúdo.")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding()
                        
                        Text("8. Obrigações legais")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .padding()
                        
                        Text("O SERVIÇO E QUALQUER OUTRO SERVIÇO E CONTEÚDO INCLUÍDO OU DE OUTRA FORMA DISPONIBILIZADOS A VOCÊ ATRAVÉS DO SERVIÇO SÃO FORNECIDOS A VOCÊ DE ACORDO COM OU CONFORME DISPONÍVEL, SEM REPRESENTAÇÕES OU GARANTIAS DE QUALQUER TIPO. ISENTAMOS TODA E QUALQUER GARANTIA E REPRESENTAÇÕES (EXPRESSAS OU IMPLÍCITAS, ORAIS OU ESCRITAS) EM RELAÇÃO AO SERVIÇO E CONTEÚDO INCLUÍDO OU DE OUTRA FORMA DISPONIBILIZADOS A VOCÊ ATRAVÉS DO SERVIÇO, SEJA ALEGADO QUE SURGIR POR OPERAÇÃO DA LEI, EM RAZÃO DE COSTUME OU USO NO COMÉRCIO, POR MEIO DE NEGOCIAÇÃO OU DE OUTRA FORMA.\n\nEM NENHUM CASO AS PESSOAS DESENVOLVEDORAS DO GERA SERÃO RESPONSÁVEIS POR VOCÊ OU QUALQUER TERCEIRO PARA QUALQUER ESPECIAL, DANOS INDIRETOS, INCIDENTAIS, EXEMPLARES OU CONSEQUENTES DE QUALQUER TIPO DECORRENTES OU EM RELAÇÃO AO SERVIÇO OU QUALQUER OUTRO SERVIÇO E/OU CONTEÚDO INCLUÍDO OU DE OUTRA FORMA DISPONIBILIZADOS A VOCÊ ATRAVÉS DO SERVIÇO, INDEPENDENTEMENTE DA FORMA DE AÇÃO, SEJA EM CONTRATO, DELITO, RESPONSABILIDADE ESTRITA OU NÃO, MESMO QUE TENHAMOS SIDO AVISADOS DA POSSIBILIDADE DE TAIS DANOS OU ESTAMOS CIENTES DA POSSIBILIDADE DE TAIS DANOS. NOSSA RESPONSABILIDADE TOTAL POR TODAS AS CAUSAS DE AÇÃO E SOB TODAS AS TEORIAS DA RESPONSABILIDADE SERÁ LIMITADA AO VALOR QUE VOCÊ PAGOU ÀS PESSOAS DESENVOLVEDORAS DO GERA. ESTA SEÇÃO TERÁ PLENO EFEITO, MESMO QUE QUALQUER TRECHO ESPECIFICADO NESTE CONTRATO SEJA CONSIDERADO FALHO EM SEU PROPÓSITO ESSENCIAL.\n\nVocê concorda em defender, indenizar e nos manter inofensivos de e contra todo e qualquer custo, danos, passivos e despesas (incluindo honorários advocatícios, custos, penalidades, juros e desembolsos) que incorremos em relação, decorrentes ou com a finalidade de evitar, qualquer reclamação ou demanda de terceiros relacionadas ao uso do Serviço por qualquer pessoa que use sua conta, incluindo qualquer alegação de que seu uso do Serviço viole qualquer lei ou regulamento aplicável, ou os direitos de qualquer terceiro, e/ou sua violação destes Termos.")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding()
                        
                        Text("9. Lei de Governo")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .padding()
                        
                        Text("A validade destes Termos e direitos, obrigações e relações das partes nos termos destes Termos serão interpretadas e determinadas sob e de acordo com as leis da República Federativa do Brasil, sem levar em conta os conflitos de princípios legais.")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding()
                        
                        Text("10. Jurisdição")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .padding()
                        
                        Text("Você concorda expressamente que a jurisdição exclusiva para qualquer disputa com o Serviço ou relativa ao seu uso dele, reside na Comarca de Recife e ainda concorda e concorda expressamente com o exercício da jurisdição pessoal na Comarca de Recife, localizada em Recife, Pernambuco, em conexão com qualquer disputa, incluindo qualquer reclamação envolvendo o Serviço. Você concorda ainda que você e o Serviço não iniciarão contra o outro uma ação coletiva, arbitragem de classe ou outra ação representativa ou processo.")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding()
                        
                        Group {
                            
                            Text("11. Terminação")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .padding()
                            
                            Text("Se você violar qualquer um destes Termos, temos o direito de suspender ou desativar seu acesso ou uso do Serviço.")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding()
                            
                            Text("11. Acordo Completo")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .padding()
                            
                            Text("Estes Termos constituem todo o acordo entre você e as pessoas desenvolvedoras do Gera em relação ao uso do Serviço, substituindo quaisquer acordos prévios entre você e as pessoas desenvolvedoras do Gera relacionados ao seu uso do Serviço.")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding()
                            
                            Text("12. Feedback")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .padding()
                            
                            Text("Por favor, deixe-nos saber o que você acha do Serviço, destes Termos e, em geral, do Gera. Quando você nos fornece qualquer comentário, comentários ou sugestões sobre o Serviço, estes Termos e, em geral, do Gera, você atribui irrevogavelmente a nós todo o seu direito, título e interesse e aos seus comentários, comentários e sugestões.")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding()
                            
                            Text("12. Perguntas e Informações de Contato")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .padding()
                            
                            Text("Perguntas ou comentários sobre o Serviço podem ser direcionados a nós no endereço de e-mail gera@riso.dev.")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding()
                            
                            Text("Política de Privacidade")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(Color(.systemPurple))
                                .padding()
                            
                            
                            Group {
                                
                                Text("Última revisão: 04/03/2021")
                                    .font(.system(size: 14, weight: .italic, design: .default))
                                
                                
                                Text("Nossa política de privacidade se aplica às informações que coletamos quando você usa ou acessa nosso site, aplicativo ou apenas interage conosco. Podemos mudar essa política de privacidade de tempos em tempos. Sempre que fazemos alterações nesta política de privacidade, as alterações são efetivas em 7 dias após a publicação da política de privacidade revisada (como indicado pela data de revisão no topo de nossa política de privacidade). Nós encorajamos você a revisar nossa política de privacidade sempre que você acessar nossos serviços para se manter informado sobre nossas práticas de informação e as maneiras que você pode ajudar a proteger sua privacidade.")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding()
                                
                                Text("Que informações este serviço coleta?")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .padding()
                                
                                Text("Coletamos informações que você fornece diretamente para nós. Por exemplo, coletamos informações quando você cria um Cartão de Cobrança Gera, solicita suporte para o Serviço ou fornece quaisquer informações identificáveis ou informações de contato ao se comunicar conosco. As informações que coletamos podem incluir seu nome, endereço de e-mail, número de telefone, informações financeiras e de pagamento (como nome do banco, agência e conta), documentos (como Cadastro de Pessoa Física - CPF) e identificadores de usuário em outros serviços (como o nome de usuário de serviço de pagamentos), além de quaisquer informações identificáveis ou informações de contato que você escolher nos fornecer.")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding()
                                
                                Text("Para quais propósitos são usadas as informações coletadas?")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .padding()
                                
                                Text("Usamos informações sobre você para vários propósitos, incluindo:\n\n- Fornecer, manter e melhorar nossos serviços;\n\n- Fornecer serviços que você solicita, como gerar um Cartão de Cobrança Gera ou compartilhá-lo com terceiros;\n\n- Enviar-lhe avisos técnicos, atualizações, alertas de segurança e suporte e mensagens administrativas;\n\n- Responder aos seus comentários, perguntas e solicitações e fornecer atendimento ao cliente;\n\n- Comunicar-se com você sobre notícias e informações relacionadas ao nosso serviço;\n\n- Monitorar e analisar tendências, uso e atividades relacionadas aos nossos serviços.\n\nAo acessar e usar nossos serviços, você concorda com o processamento e transferência de suas informações nos Estados Unidos e em outros países.")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding()
                                
                                Text("Compartilhamento de Informações")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .padding()
                                
                                Text("Podemos compartilhar informações pessoais sobre você da seguinte forma:\n\n- Com fornecedores de terceiros e outros provedores de serviços que precisam de acesso às suas informações para fornecer os serviços, como o Apple Wallet;\n\n- Quando você escolhe expressamente compartilhar com terceiros, por exemplo, quando você compartilha um Cartão de Cobrança Gera com seus dados de pagamento;\n\n- Se acreditarmos que a divulgação é razoavelmente necessária para cumprir qualquer lei, regulamento, processo legal ou solicitação governamental aplicável;\n\n- Para aplicar os acordos ou políticas de usuário aplicáveis, incluindo nossos Termos de Serviço **[URL PARA TERMOS DE SERVIÇO]**; e proteger a nós, nossos usuários ou o público de danos ou atividades ilegais;\n\n- Se notificarmos você através de nossos serviços (ou em nossa política de privacidade) que as informações que você fornece serão compartilhadas de uma maneira particular e você fornece tais informações.\n\nSeus dados pessoais (como nome, endereço de e-mail e número de telefone), informações financeiras e de pagamento (como nome do banco, agência e conta), documentos (como Cadastro de Pessoa Física - CPF) e identificadores de usuário em outros serviços (como o nome de usuário de serviço de pagamentos) **não** são compartilhados com terceiros para fins de publicidade.\n\nOs dados relacionados aos Cartões de Cobrança Gera não permanecerão nos nossos servidores por mais de 30 dias após a criação. Note, entretanto, que terceiros podem ter uma cópia do conteúdo caso você o compartilhe externamente ou salve-o no Apple Wallet.")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding()
                                
                                Text("Segurança")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .padding()
                                
                                Group {
                                    Text("Tomamos medidas razoáveis para ajudar a proteger informações pessoais contra perdas, roubos, uso indevido e acesso não autorizado, divulgação não autorizada, alteração e destruição.")
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .padding()
                                    
                                    Text("Entre em contato conosco")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .padding()
                                    
                                    Text("Se você tiver alguma dúvida sobre esta política de privacidade, entre em contato conosco em gera@riso.dev.")
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .padding()
                                    
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Text("Concordar")
                                            .foregroundColor(Color(.systemBackground))
                                        
                                    }
                                    .padding()
                                    .background(Color(.systemPurple))
                                    .cornerRadius(7)
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Text("Voltar")
                                            .foregroundColor(Color(.systemPurple))
                                        
                                    }
                                    .padding()
                                    .cornerRadius(7)
                                }
                            }
                        }
                    }
                }
                
            }
            
        }
        .padding()
    }
}
}

struct TermsConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsConditionsView()
    }
}
