-- �� �� �� Event.xml(mapper) �� �� ��
-- id=eventListAll (�ֱټ������ �̺�Ʈ�� ��������)
SELECT * FROM EVENT ORDER BY EVENTDATE DESC;
-- id=eventListPaging(�̺�Ʈ �۸��)
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM EVENT ORDER BY EventNo DESC) A)
    WHERE RN BETWEEN 1 AND 4;
-- id=writeEvent(�̺�Ʈ �۾���)
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '�������̺�Ʈ', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '�������̺�Ʈ', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '�ٴٴ��̺�Ʈ', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '�����̺�Ʈ', 'pic1.jpg', 0, SYSDATE);
SELECT * FROM EVENT ORDER BY EVENTNO DESC;
-- id=detailEvent(�̺�Ʈ �ۻ󼼺���)
SELECT * FROM EVENT WHERE EventNo=1;
-- id=modifyEvent(�̺�Ʈ �ۼ���)
UPDATE EVENT SET
    EventTitle='����Ŭ�̺�Ʈ',
    EventFile='pic3.jpg',
    EventDate=SYSDATE,
    EVENTReadCount = 0
    WHERE EventNo='2';
-- id=ReadcountEvent(�̺�Ʈ ��ȸ�� �ϳ� �ø���)
UPDATE EVENT SET EventReadCount = EventReadCount+1 WHERE EventNo=1;
-- id=deleteEvent(�̺�Ʈ �ۻ���)
DELETE FROM EVENT WHERE EventNo=2;
-- id=countEvent(�̺�Ʈ �۰���)
SELECT COUNT(*) FROM EVENT;
SELECT * FROM EVENT;
COMMIT;

-- �� �� �� ITEM.xml(mapper) �� �� ��
-- id=writeItem(���� �����۸����)
INSERT INTO ITEM VALUES
    (ITEM_SEQ.NEXTVAL, '�������', 'HONNY.JPG', '5000');
-- id=listItem(���� ������ ���)
SELECT * FROM ITEM;
-- id=modifyItem(���� �����ۼ���)
UPDATE ITEM SET
    ItemName='��Ͼ�����',
    ItmeImage='ONION.JPG',
    ItemPrice='4000'
    WHERE ItemNo=2;
-- id=deleteItem(���� �����ۻ���)
DELETE FROM ITEM WHERE ItemNo=2;
SELECT * FROM ITEM;
-- id=getItem(������ ��������)
SELECT * FROM ITEM WHERE ITEMNO=1;
-- id=countgetItem(������ ������ ����)
SELECT COUNT(*) FROM ITEM;



-- �� �� �� PURCHASE.xml(mapper) �� �� ��
-- id=listPurchase(������� ���� �ֹ�����Ʈ)
SELECT * FROM PURCHASE;
-- id=addPurchase
INSERT INTO PURCHASE VALUES
    (PURCHASE_SEQ.NEXTVAL, 'AAA', '19000', SYSDATE);
-- id=getLastPurchaseNo
SELECT * FROM PURCHASE ORDER BY PURCHASENO DESC;

-- �� �� �� PURCHASEITEM.xml(mapper) �� �� ��
-- id=listPurchaseItem
SELECT * FROM PURCHASEITEM;
-- id=addPurchaseItem
INSERT INTO PURCHASEITEM VALUES
    (PURCHASEITEM_SEQ.NEXTVAL, '1','1');
SELECT * FROM PURCHASEITEM WHERE PurchaseItemNo=14;
COMMIT;