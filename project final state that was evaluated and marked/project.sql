--Stored Procedures
alter PROCEDURE UpdateMemberDetails
    @full_name NVARCHAR(50),
    @dob nvarchar(50),
    @contact_no NVARCHAR(50),
    @email NVARCHAR(50),
    @state NVARCHAR(50),
    @city NVARCHAR(50),
    @pincode NVARCHAR(50),
    @full_address NVARCHAR(max),
	@member_id nvarchar(50),
    @password NVARCHAR(50),
    @account_status nvarchar(50)
AS
BEGIN
    UPDATE member_master_tbl
    SET 
        full_name = @full_name,
        dob = @dob,
        contact_no = @contact_no,
        email = @email,
        state = @state,
        city = @city,
        pincode = @pincode,
        full_address = @full_address,
        password = @password,
        account_status = @account_status
    WHERE 
        member_id = @member_id;
END

alter PROCEDURE UpdateBalance
	@member_id nvarchar(50),
    @card_balance NVARCHAR(50)
AS
BEGIN
    UPDATE member_master_tbl
    SET 
        card_balance= cast((cast(card_balance as int) + cast(@card_balance as int)) as nvarchar)
    WHERE 
        member_id = @member_id;
END

alter procedure reserve
@member_id nvarchar(50),
@train_id nvarchar(50)
as
begin
declare @price nvarchar(50)

select @price=price from train_master_tbl where train_id=@train_id;

update member_master_tbl set card_balance= cast((cast(card_balance as int) - cast(@price as int)) as nvarchar)
where member_id =@member_id;

insert into reservations(member_id,train_id)
values(@member_id,@train_id);
end

--Foriegn Keys
 alter table reservations
  add constraint fkreservations
  foreign key (train_id) references train_master_tbl(train_id)


  --Triggers
create trigger insertedsuccessfully
on ComplaintsAndQueries
after insert
as
begin
    print 'User complaint inserted successfully'
end




-- Trigger for inserting users
CREATE TRIGGER insertUser
ON signup
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status) AND EXISTS (SELECT 1 FROM inserted WHERE status = 'granted')
    BEGIN
        INSERT INTO users (user_id, first_name, last_name, user_pwd, contact_number, user_email, occupation, house_number, road_number, block, city)
        SELECT i.user_id, i.first_name, i.last_name, i.user_pwd, i.contact_number, i.user_email, i.occupation, i.house_number, i.road_number, i.block, i.city
        FROM inserted i
        WHERE i.status = 'granted';
    END;
END;

-- Trigger for updating signup status
CREATE TRIGGER update_signup
ON permission
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status)
    BEGIN
        UPDATE signup
        SET status = i.status
        FROM inserted i
        WHERE signup.user_id = i.user_id;
    END;
END;

-- Trigger for inserting into user_login upon user insertion
CREATE TRIGGER insert_user_login
ON users
AFTER INSERT
AS
BEGIN
    INSERT INTO user_login (user_email, user_pwd)
    SELECT i.user_email, i.user_pwd
    FROM inserted i;
END;

-- Trigger for updating metrocard
CREATE TRIGGER update_metrocard
ON metrocard_user
AFTER UPDATE
AS
BEGIN
    IF UPDATE(user_id)
    BEGIN
        UPDATE permission
        SET status = 'granted'
        WHERE user_id IN (SELECT i.user_id FROM inserted i);
    END;
END;





-- Trigger for inserting into Complaint_logbook
CREATE TRIGGER complaint_log_book
ON Complaint_management
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status) AND EXISTS (SELECT 1 FROM inserted WHERE status = 'Checked')
    BEGIN
        INSERT INTO Complaint_logbook (complaint_id, reply_msg, reply_time)
        SELECT d.complaint_id, d.reply_msg, d.reply_time
        FROM deleted d
        WHERE d.status = 'Checked';
    END;
END;


--Views
CREATE VIEW ROUTE_VIEW
AS
SELECT REPLACE(s.Station_ID, 'S', 'Station-') AS StationID,
       INITCAP(s.Station_Address) AS StationsAddress,
       UPPER(t.TRAIN_NAME) AS TrainName,
       r.Arrival_time AS Arrivaltime,
       r.Departure_time AS Departuretime,
       sm.Total_compartment AS NumberofCompartment,
       sm.Seat_per_compartment * sm.Total_compartment AS NumberofSeats
FROM Stations s
JOIN Route_details rd ON s.Station_id = rd.Station_id
JOIN Route r ON rd.TRAIN_ID = r.TRAIN_ID
JOIN TRAINS t ON r.TRAIN_ID = t.TRAIN_ID
JOIN Seat_Management sm ON t.TRAIN_ID = sm.TRAIN_ID;

-- Maximum Recharge User
CREATE VIEW MaximumRechargeUser
AS
SELECT mu.User_id AS "User ID",
       SUM(r.Recharge_Amount) AS "Recharge Amount"
FROM MetroCard_user mu
JOIN Recharge_details rd ON mu.User_id = rd.User_id
JOIN Recharge r ON rd.Recharge_id = r.Recharge_id
GROUP BY mu.User_id
HAVING SUM(r.Recharge_Amount) = (SELECT MAX(SUM(Recharge_Amount))
                                 FROM MetroCard_user mu
                                 JOIN Recharge_details rd ON mu.User_id = rd.User_id
                                 JOIN Recharge r ON rd.Recharge_id = r.Recharge_id
                                 GROUP BY mu.User_id);










