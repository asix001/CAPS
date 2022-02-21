#addpath('C:\Users\Asia\Desktop\zajecia_online\Exercises in Computer-Aided Problem Solving\liblinear-2.30\matlab')

#loading data
fid=fopen('t10k-images-idx3-ubyte','r','b');
fread(fid,4,'int32');
data=fread(fid,[28*28,10000],'uint8');
fclose(fid);

#loading my_numbers
sample1=imread('my_number.png');
sample2=imread('my_number2.png');
sample1=mean(sample1,3);
sample2=mean(sample2,3);

#labels
fid=fopen('t10k-labels-idx1-ubyte','r','b');
fread(fid,2,'int32');
label=fread(fid,10000,'uint8');
fclose(fid);

#training
tr_label = label(1:5000);
tr_data = data(:,1:5000);
model = train(tr_label,sparse(tr_data)');

#test1
te_label = label(5001:6000);
te_data = data(:,5001:6000);
pred_label=predict(te_label,sparse(te_data)',model);

pred1=predict([0],sparse(reshape(sample1',1,28*28)),model)
pred2=predict([5],sparse(reshape(sample2',1,28*28)),model)

