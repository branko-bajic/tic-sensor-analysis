data = readtable("Log 2019-08-05-0004.xlsx");
rightRows = data.Side=="R";
leftRows = data.Side=="L";
vars = {'Milis', 'W', 'X', 'Y', 'Z'};
milis = data.Milis;
rightQuat = data{rightRows, vars};
leftQuat = data{leftRows, vars};
leftLength = length(leftQuat);
rightLength = length(rightQuat);


figuredata = readtable("Log 2019-08-05-0004.xlsx");
rightRows = data.Side=="R";
leftRows = data.Side=="L";
vars = {'Milis', 'W', 'X', 'Y', 'Z'};
milis = data.Milis;
rightQuat = data{rightRows, vars};
leftQuat = data{leftRows, vars};
leftLength = length(leftQuat);
rightLength = length(rightQuat);


figure
hold on
for i = 2:5
    %%plot(right(:,1),right(:,i))
    %%plot(leftQuat(1:leftLength-2,1), envelope(bandpass(diff(leftQuat(:,i), 2), [40 50], 500)))
    %%plot(rightQuat(:,1),rightQuat(:,i))
    %%display(findpeaks(envelope(bandpass(diff(leftQuat(:,i), 2), [40 50], 500))))
    plot(leftQuat(:,1), leftQuat(:,i) - mean(leftQuat(:,i)))
    plot(leftQuat(:,1), mean(leftQuat(:,i)))
    
    display(std(envelope(bandpass(diff(leftQuat(:,i), 2), [40 50], 500))))
    display(var(envelope(bandpass(diff(leftQuat(:,i), 2), [40 50], 500))))
    display(mean(envelope(bandpass(diff(leftQuat(:,i), 2), [40 50], 500))))

    display(std(bandpass(diff(leftQuat(:,i), 2), [40 50], 500)))
    display(var(bandpass(diff(leftQuat(:,i), 2), [40 50], 500)))

    display(std(diff(leftQuat(:,i), 2)))
    display(var(diff(leftQuat(:,i), 2)))
    %%plot(right(1:rightLength-1,1), diff(right(:,i)))
    %%plot(left(:,1), left(:,i))
end
legend("W Env", "W Pos", "W Mean", "X Env", "X Pos", "X Mean", "Y Env", "Y Pos", "Y Mean", "Z Env", "Z Pos", "Z Mean");
f = linspace(-500, 500, leftLength-2);
figure
hold on
for i = 2:5
    %%plot(right(:,1),right(:,i))
    plot(f, fft(abs(bandpass(diff(leftQuat(:,i), 2), [40 50], 500))))
    %%plot(rightQuat(:,1),rightQuat(:,i))
    %%plot(right(1:rightLength-1,1), diff(right(:,i)))
    %%plot(left(:,1), left(:,i))
end
legend("W", "X", "Y", "Z");