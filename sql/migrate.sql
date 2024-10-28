--
-- ADD: `agent_fullname_eng1`
--
START TRANSACTION;

SET @agent_fullname_acc1_order=(SELECT `ord` FROM `inputs_exch` WHERE `name` = 'agent_fullname_acc1');

UPDATE `inputs_exch` SET `ord` = `ord` + 1 WHERE `ord` > @agent_fullname_acc1_order;

INSERT INTO `inputs_exch`
(`ord`, `name`, `value`, `descr`, `fieldtype`, `parent`, `header`, `mandatory`, `pctwidth`, `note`, `regexp`, `validation_info`) VALUES
    (@agent_fullname_acc1_order + 1, 'agent_fullname_eng1', '', '', '1', '', '0', '1', '50', '(англійською мовою)', '', '');

COMMIT;

--
-- ADD: `agent_fullname_acc2`
--
START TRANSACTION;

SET @agent_fullname_acc2_order=(SELECT `ord` FROM `inputs_exch` WHERE `name` = 'agent_fullname_acc2');

UPDATE `inputs_exch` SET `ord` = `ord` + 1 WHERE `ord` > @agent_fullname_acc2_order;

INSERT INTO `inputs_exch`
(`ord`, `name`, `value`, `descr`, `fieldtype`, `parent`, `header`, `mandatory`, `pctwidth`, `note`, `regexp`, `validation_info`) VALUES
    (@agent_fullname_acc2_order + 1, 'agent_fullname_eng2', '', '', '1', '', '0', '1', '50', '(англійською мовою)', '', '');

COMMIT;

--
-- REMOVE: `bank_code1`
--
START TRANSACTION;

SET @var_order=(SELECT `ord` FROM `inputs_exch` WHERE `name` = 'bank_code1');

DELETE FROM `inputs_exch` WHERE `inputs_exch`.`name` = 'bank_code1';

UPDATE `inputs_exch` SET `ord` = `ord` - 1 WHERE `ord` > @var_order;

ALTER TABLE `users` DROP `bank_code1`;

COMMIT;

--
-- CHANGE: `company_ownership_form`
--
UPDATE `inputs_exch` SET `value` = 'Державна,Приватна,Комунальна', `fieldtype` = 3, `pctwidth` = 50 WHERE `name` = 'company_ownership_form';