const { v4: uuidv4 } = require('uuid');

Feature('question test');

Scenario('test create account and logout', ({I}) => {
	I.amOnPage('http://localhost:9080/login');
	I.fillField({id: 'fUsername'}, uuidv4());
	I.fillField('email', uuidv4() + '@example.com');
	I.fillField('firstName', uuidv4());
	I.fillField('lastName', uuidv4());
	I.fillField({id: 'fPassword'}, secret("Pa$$w0rd"));
	I.fillField({id: 'fConfirmPassword'}, secret("Pa$$w0rd"));
	I.click({css: '#fRegister'});
	I.seeCurrentUrlEquals('http://localhost:9080/');
	I.amOnPage('http://localhost:9080/submitQuestion');
	I.fillField({id: 'tfTitle'}, 'new question');
	I.fillField({id: 'tfText'}, 'new question');
	I.click({css: '#bSubmitQuestion'});
	I.seeCurrentUrlEquals('http://localhost:9080/questions');
	I.see('Questions List');
});
