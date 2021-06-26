# Login Presenter

> ## Roules
1. ✅ Call Validation when email changes
2. ✅ Notify EmailErroStream with the same error as Validation if it returns an error
3. Notify EmailErroStream with null if Validation does not return error
4. Não notificar o EmailErroStream se o valor for igual ao último
5. Notify isFormValidValidStream after changing email
6. Call Validation when changing password
7. Notify PasswordErroStream with the same Validation error if it returns an error
8. Notify PasswordErroStream with null if Validation does not return error
9. Do not notify PasswordErroStream if value equals last
10. Notify isFormValidValidStream after changing password
11. For the form to be valid all error streams must be null and all mandatory fields cannot be empty
12. Do not notify isFormValidValidStream if value equals last
13. Call Authentication with correct email and password
14. Notify isLoadingStream as true before calling Euthentication
15. Notify isLoadingStream with false at the end of Authentication
16. Notify mainErrorStream if Authentication returns a DomainError
17. Close all Streams in dispose
18. ⛔️ Write Account to cache on success
19. ⛔️ Levar o usuário para a tela de enquetes em cas ode sucesso


> ## Regras
1. Chamar Validation ao alterar o email
2. Notificar o EmailErroStream com o mesmo erro do Validation, caso retorne erro 
3. Notificar o EmailErroStream com o null, caso o Validation não retorne erro
4. Não notificar o EmailErroStream se o valor for igual ao último
5. Notificar o isFormValidValidStream após alterar o email 
6. Chamar Validation ao alterar a senha
7. Notificar o PasswordErroStream com o mesmo erro de Validation, caso retorne erro
8. Notificar o PasswordErroStream com null, caso o Validation nao retorne erro
9. Não notificar o PasswordErroStream se o valor for igual ao último
10. Notificar o isFormValidValidStream após alterar a senha
11. Para o formulário estar válido todos os stream de erro precisam estar null e todos os campos obrigatórios não podem estar vazios
12. Não notificar o isFormValidValidStream se o valor for igual ao último
13. Chamar o Authentication com email e senha corretos
14. Notificar o isLoadingStream como true antes de chamar o Euthentication
15. Notificar o isLoadingStream com false no fim do  Authentication
16. Notificar o mainErrorStream caso o Authentication retorne  um DomainError
17. Fechar todos os Streams no dispose
18. ⛔️ Gravar o Account no cache em caso de sucesso
19. ⛔️ Levar o usuário para a tela de enquetes em cas ode sucesso
