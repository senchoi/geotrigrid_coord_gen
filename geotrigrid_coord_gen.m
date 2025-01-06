clear;

function sequence = generate_sequence(num_elements)%1,2,2,3,3...
    sequence = [1];  % 1은 한 번만 추가
    remaining_elements = num_elements - 1;
    i = 2;
    
    while length(sequence) < num_elements
        if remaining_elements >= 2
            sequence = [sequence, i, i];
            remaining_elements = remaining_elements - 2;
        else
            sequence = [sequence, i];
            break;
        end
        i = i + 1;
    end
end

function sequence = generate_sequence2(start_number, total_elements)%15,15,14,14,13...
    sequence = [];
    sequence(end+1)=start_number;
    for i=1:total_elements-1
        if mod(i,2)==0
            start_number=start_number-1;
        end
        sequence(end+1)=start_number;
    end
end

function sequence = generate_sequence3(start_number, total_elements)%1,1,2,2,..
    sequence = [];
    for i=1:total_elements
        sequence(end+1)=start_number;
        if mod(i,2)==0
            start_number=start_number+1;
        end
    end
end

function sequence = generate_sequence4(n,i)%2;3,3;3,4,4;n=3
                                    %2;3,3;3,4,4;4,4,5,5;n=4
                           %2;3,3;3,4,4;4,4,5,5;4,5,5,6,6;n=5
                   %2;3,3;3,4,4;4,4,5,5;4,5,5,6,6;5,5,6,6,7,7;n=6
    inits=generate_sequence(n)+1;
    if mod(i,2)==0
        sequence=generate_sequence3(inits(i),i);
    else
        sequence=generate_sequence(i)+inits(i)-1;
    end
end

function sequence = generate_sequence5(n,i)%2;3,3;3,4,4;n=3
                                    %2;3,3;3,4,4;4,4,5,5;n=4
                           %2;3,3;3,4,4;4,4,5,5;4,5,5,6,6;n=5
                   %2;3,3;3,4,4;4,4,5,5;4,5,5,6,6;5,5,6,6,7,7;n=6
                   %remove last element
    inits=generate_sequence(n)+1;
    if mod(i,2)==0
        sequence=generate_sequence3(inits(i),i-1);
    elseif i==1
        sequence=[];
    else
        sequence=generate_sequence(i-1)+inits(i)-1;
    end
end

function sequence = generate_sequence6(n,i)%2,2;2,1,1;1,1,15,15...n=3
                                           %3,2;2,2,1;2,1,1,20;1,1,20,20,19...n=4
                             %3,3;3,2,2;2,2,1,1;2,1,1,25,25;1,1,25,25,24,24...n=5
            %4,3;3,3,2;3,2,2,1;2,2,1,1,30;2,1,1,30,30,29;1,1,30,30,29,29,28...n=6
    tempseq=generate_sequence3(1,5*n*2);
    tempseq1=flip(tempseq);
    tempseq2=tempseq1(end-n:end);
    tempseq3=tempseq2(i:end);
    if i<=ceil(n/2)
        sequence=tempseq3(1:i+1);
    else
        sequence=[tempseq2(i:end),tempseq1(1:2*floor(i-n/2)+mod(n,2)-1)];
    end
end

function sequence = generate_sequence7(n,i)%4;5,4;6,5,5...n=3
                                   %4;5,5;6,6,5;7,7,6,6...n=4
                         %5;6,5;7,6,6;8,7,7,6;9,8,8,7,7...n=5
           %5;6,6;7,7,6;8,8,7,7;9,9,8,8,7;10,10,9,9,8,8...n=6
    tempseq=(floor((n+1)/2)+2):((floor((n+1)/2)+2)+(n-1));
    tempseq1=generate_sequence3(1,tempseq(i)*2-mod(n,2));
    tempseq1=flip(tempseq1);
    sequence=tempseq1(1:i);
end

function sequence = generate_sequence8(n,i)%3;4,3;4,3,2...n=3
                                   %4;4,3;5,4,3;5,4,3,2...n=4
                         %4;5,4;5,4,3;6,5,4,3;6,5,4,3,2...n=5
             %5;5,4;6,5,4;6,5,4,3;7,6,5,4,3;7,6,5,4,3,2...n=6
    tempseq=generate_sequence3(floor(n/2)+2,n+mod(n,2));
    if mod(n,2)==1
        tempseq=tempseq(2:end);
    end
    tempseq1=tempseq(i):-1:1;
    sequence=tempseq1(1:i);
end

function sequence = generate_sequence9(n,i)%generate_sequence...even
                                           %generate_sequence3...odd
    oddseq=generate_sequence(n-1);
    if mod(i,2)==0
        tempseq=generate_sequence(n-i+1)+4*n-oddseq(i)+1;
        sequence=tempseq(1:n-i+1);
    else
        sequence=generate_sequence3(4*n+2-oddseq(i),n-i+1);
    end
    
end

function sequence = generate_sequence10(n,i)%4,4,5;5,5...n=3
                                    %4,5,5,6;5,6,6;6,7...n=4
                          %5,5,6,6,7;6,6,7,7;7,7,8;8,8...n=5
             %5,6,6,7,7,8;6,7,7,8,8;7,8,8,9;8,9,9;9,10...n=6
    inits=ceil(n/2+2):(ceil(n/2+2)+n-2);
    if mod(n,2)==0
        tempseq=generate_sequence(n)+inits(i)-1;
        sequence=tempseq(1:n-i+1);
    else
        sequence=generate_sequence3(inits(i),n-i+1);
    end
    
end

function sequence = generate_sequence11(n,i)%5;6,6...n=3
                                      %6;7,7;7,8,8...n=4
                            %7;8,8;8,9,9;9,9,10,10...n=5
         %8;9,9;9,10,10;10,10,11,11;10,11,11,12,12...n=6
    inits=generate_sequence(n-1)+n+1;
    if mod(i,2)==0
        sequence=generate_sequence3(inits(i),i);
    else
        tempseq=generate_sequence(n)+inits(i)-1;
        sequence=tempseq(1:i);
    end
    
end

function sequence = generate_sequence12(n,i)%4,4,5;5,5,6...n=3
                                      %4,5,5,6;5,6,6,7;6,7,7,8...n=4
                            %5,5,6,6,7;6,6,7,7,8;7,7,8,8,9;8,8,9,9,10...n=5
%5,6,6,7,7,8;6,7,7,8,8,9;7,8,8,9,9,10;8,9,9,10,10,11;9,10,10,11,11,12...n=6
    inits=(ceil(n/2)+2):(ceil(n/2)+n);
    if mod(n,2)==0
        sequence=generate_sequence(n)+inits(i)-1;
    else
        sequence=generate_sequence3(inits(i),n);
    end
    
end

function sequence = generate_sequence13(n,i)%15,15,14,14;14,14,13,13...n=3
                       %20,20,19,19,18;19,19,18,18,17;18,18,17,17,16...n=4
%25,25,24,24,23,23;24,24,23,23,22,22;23,23,22,22,21,21;22,22,21,21,20,20n=5
%30,30,29,29,28,28,27;29,29,28,28,27,27,26;28,28,27,27,26,26,25;...
                    %27,27,26,26,25,25,24;26,26,25,25,24,24,23;...n=6
    fulllist=generate_sequence3(1,5*n*2);
    fulllist=flip(fulllist);
    sequence=fulllist(1:n+1)-i+1;
end

function sequence = generate_sequence14(n,i)%7,6,6,5;8,7,7,6...n=3
                            %8,8,7,7,6;9,9,8,8,7;10,10,9,9,8...n=4
%10,9,9,8,8,7;11,10,10,9,9,8;12,11,11,10,10,9;13,12,12,11,11,10...n=5
%11,11,10,10,9,9,8;12,12,11,11,10,10,9;13,13,12,12,11,11,10;...
                    %14,14,13,13,12,12,11;15,15,14,14,13,13,12;...n=6
    fulllist=generate_sequence3(1,(n+2+ceil(n/2))*2);
    fulllist=flip(fulllist);
    if mod(n,2)==0
        sequence=fulllist(1:n+1)+i-1;
    else
        fulllist=fulllist(2:end);
        sequence=fulllist(1:n+1)+i-1;
    end
end

function sequence = generate_sequence15(n,i)%6,6,5;7,6...n=3
                                    %8,7,7,6;8,8,7;9,8...n=4
                    %9,9,8,8,7;10,9,9,8;10,10,9;11,10;...n=5
%11,10,10,9,9,8;11,11,10,10,9;12,11,11,10;12,12,11;13,12...n=6
    fulllist=generate_sequence3(1,(2*n+1)*2);
    fulllist=flip(fulllist);
    sequence=fulllist(n-i+1:n-i+1+n-i);
end

function sequence = generate_sequence16(n,i)%7;8,7...n=3
                                    %8;9,9;10,10,9...n=4
                    %10;11,10;12,11,11;13,12,12,11...n=5
     %11;12,12;13,13,12;14,14,13,13;15,15,14,14,13...n=6
    fulllist=generate_sequence3(1,(2*n+floor((n+1)/2))*2);
    fulllist=flip(fulllist);
    if mod(n,2)==0
        sequence=fulllist((n-1)*2-(2*i-1):(n-1)*2-(2*i-1)+i-1);
    else
        sequence=fulllist(n*2-2*i:n*2-2*i+i-1);
    end
end

function sequence = generate_sequence17(n,i)%10,11,11,12;10,10,11;9,10;n=3
                          %13,14,14,15,15;13,13,14,14;12,13,13;12,12...n=4
        %16,17,17,18,18,19;16,16,17,17,18;15,16,16,17;15,15,16;14,15...n=5
            %19,20,20,21,21,22,22;19,19,20,20,21,21;18,19,19,20,20;...
                                         %18,18,19,19;17,18,18;17,17...n=6
    tempseq=generate_sequence3(1,(3*n+1)*2);
    tempseq=flip(tempseq);
    if mod((n-i+1),2)==0
        sequence=generate_sequence3(tempseq(n-i+1),i+1);
    else
        sequence=generate_sequence(i+1)+tempseq(n-i+1)-1;
    end
end

function sequence = generate_sequence18(n,i)%6,6,7;7,7;8;...n=3
                                  %7,8,8,9;8,9,9;9,10;10;...n=4
              %9,9,10,10,11;10,10,11,11;11,11,12;12,12;13...n=5
%10,11,11,12,12,13;11,12,12,13,13;12,13,13,14;13,14,14;14,15;15;n=6
    inits=n+1+floor((n+1)/2):n+1+floor((n+1)/2)+n-1;
    if mod(n,2)==0
        sequence=generate_sequence(i)+inits(n-i+1)-1;
    else
        sequence=generate_sequence3(inits(n-i+1),i);
    end
end

function sequence = generate_sequence19(n,i)%7,8,9;8,9;8;...n=3
                           %9,10,11,12;10,11,12;10,11;11;...n=4
           %11,12,13,14,15;12,13,14,15;12,13,14;13,14;13;...n=5
%13,14,15,16,17,18;14,15,16,17,18;14,15,16,17;15,16,17;15,16;16;n=6
    inits=generate_sequence(n)+2*n;
    sequence=inits(n-i+1):inits(n-i+1)+i-1;
end

function sequence = generate_sequence20(n,i)%13,13,12,12;12,12,11;11,11;n=3
                             %17,17,16,16,15;16,16,15,15;15,15,14;14,14;n=4
           %21,21,20,20,19,19;20,20,19,19,18;19,19,18,18;18,18,17;17,17;n=5
     %25,25,24,24,23,23,22;24,24,23,23,22,22;23,23,22,22,21;22,22,21,21;
                                                        %21,21,20;20,20;n=6
    fulllist=generate_sequence3(1,(4*n+1)*2);
    fulllist=flip(fulllist);
    sequence=fulllist((n-i+1)*2-1:(n-i+1)*2-1+i);
end

function sequence = generate_sequence21(n,i)%11,10,9;10,9;10...n=3
                              %14,13,12,11;14,13,12;13,12;13...n=4
               %18,17,16,15,14;17,16,15,14;17,16,15;16,15;16...n=5
%21,20,19,18,17,16;21,20,19,18,17;20,19,18,17;20,19,18;19,18;19;n=6

    inits=generate_sequence3(1,(3*n+ceil(n/2))*2);
    inits=flip(inits);
    if mod(n,2)==1
        inits=inits(2:end);
    end
    sequence=inits(n-i+1):-1:inits(n-i+1)-i+1;
end

function sequence = generate_sequence22(n,i)%11,10,9;10,9;10...n=3
                              %14,13,12,11;14,13,12;13,12;13...n=4
               %18,17,16,15,14;17,16,15,14;17,16,15;16,15;16...n=5
%21,20,19,18,17,16;21,20,19,18,17;20,19,18,17;20,19,18;19,18;19;n=6

    listends=2*n+n-i+1;
    tempseq=generate_sequence(i)+listends-1;
    sequence=flip(tempseq);
end

function sequence = generate_sequence23(n,i)%10,10,9;9,9;8;...n=3
                              %13,13,12,12;12,12,11;11,11;10...n=4
               %16,16,15,15,14;15,15,14,14;14,14,13;13,13;12...n=5
%19,19,18,18,17,17;18,18,17,17,16;17,17,16,16;16,16,15;15,15;14...n=6

    fulllist=generate_sequence3(1,(4*n+1)*2);
    fulllist=flip(fulllist);
    sequence=fulllist((n-i+1)*2-1:(n-i+1)*2-1+i-1);
end

function sequence = generate_sequence24(n,i)%8,7,6;7,6;7...n=3
                                    %10,9,8,7;10,9,8;9,8;9...n=4
                    %13,12,11,10,9;12,11,10,9;12,11,10;11,10;11...n=5
%15,14,13,12,11,10;15,14,13,12,11;14,13,12,11;14,13,12;13,12;13...n=6

    inits=generate_sequence3(1,(3*n+ceil(n/2)+1)*2);
    inits=flip(inits);
    if mod(n,2)==1
        inits=inits(2:end);
    end
    sequence=inits(n-i+1):-1:inits(n-i+1)-i+1;
end

function sequence = generate_sequence25(n,i)%6,5,5;6,6;7;...n=3
                                    %7,7,6,6;8,7,7;8,8;9;...n=4
                      %9,8,8,7,7;9,9,8,8;10,9,9;10,10;11;...n=5
%10,10,9,9,8,8;11,10,10,9,9;11,11,10,10;12,11,11;12,12;13...n=6
    fulllist=generate_sequence3(1,(3*n+1)*2);
    fulllist=flip(fulllist);
    inits=fulllist(2:2+n-1);
    inits=flip(inits);
    tempseq=generate_sequence3(1,inits(n-i+1)*2);
    tempseq=flip(tempseq);
    if mod(n+(n-i+1),2)==0
        tempseq=tempseq(2:end);
    end
    sequence=tempseq(1:i);

end
%% End of generator functions

n=3;
num_of_faces=20*n^2;
num_of_vertices=n*5*(n+1)+2+sum(1:n-1)*5*2;%10n^2+2

basePoint = [1, n+1, n+1,2*n+1,2*n+1,2*n+1,0,1,1,ceil(n/2)+1,ceil(n/2)+1,ceil(n/2)+1];
lists={};
lists{end+1}=basePoint;

for i=1:n
    x_row_x=ones(i*5,1)*(1+i);
    x_row_y=[(n-i+1):(n+i+1),ones(1,i)*(n+1+i),(n+i):-1:(n-i+2)]';
    x_row_z=[(n+1):-1:(n-i+1),(n+2-i):(n+1+i),ones(1,i)*(n+1+i),(n+i):-1:(n+2)]';
    x_row_a=[(2*n+1-i):(2*n+1+i),(2*n+i):-1:(2*n+1-i),ones(1,i-1)*(2*n+1-i)]';
    x_row_b=[ones(1,i+1)*(2*n+1-i),(2*n+2-i):(2*n+1+i),(2*n+i):-1:(2*n+2-i)]';
    x_row_c=[(2*n+1):-1:(2*n+1-i),ones(1,i)*(2*n+1-i),(2*n+2-i):(2*n+i+1),...
        (2*n+i):-1:(2*n+2)]';
    if i==n
        x_col_x=[1:5*n]';
    else
        x_col_x=zeros(i*5,1)*(1+i);
    end
    templist=[1,generate_sequence2(n*5, n-1)];
    templist2=generate_sequence3(2,n);
    f=@(n, i) 5*n * (i > 1);
    x_col_y=[zeros(1,i),generate_sequence(i)+(5*n-i),templist(i):f(n,i),1:templist2(i),...
        generate_sequence4(n,i),zeros(1,i-1)]';
    x_col_z=[i+1,zeros(1,i*2-1),generate_sequence(i)+(5*n-i),...
        templist(i):f(n,i),1:templist2(i),generate_sequence5(n,i)]';
    clear templist templist2 f;
    x_col_a=[generate_sequence6(n,i),zeros(1,i*2-1),...
        generate_sequence7(n,i),generate_sequence8(n,i)]';
    x_col_b=[generate_sequence8(n,i),generate_sequence6(n,i),zeros(1,i*2-1),generate_sequence7(n,i)]';
    x_col_c=[generate_sequence7(n,i),generate_sequence8(n,i),generate_sequence6(n,i),zeros(1,i*2-1)]';
    lists{end+1}=[x_row_x,x_row_y,x_row_z,x_row_a,x_row_b,x_row_c,...
        x_col_x,x_col_y,x_col_z,x_col_a,x_col_b,x_col_c];
end


for i=1:(n-1) %|y2-y1|<=2n, |x2-x1|<=2n
    x_row_x=ones(n*5,1)*(1+n+i);
    x_row_y=[(1+i):(1+2*n+i), ones(1,n-i)*(1+2*n+i),(2*n+i):-1:(i+1),...
        ones(1,i-1)*(i+1)]';
    x_row_z=[(n+1):-1:(i+1),ones(1,i)*(i+1),(i+2):(2*n+1+i),ones(1,n-i)*(2*n+1+i),...
        (2*n+i):-1:(n+2)]';
    x_row_a=[(n+1):(3*n+1-i),ones(1,i)*(3*n+1-i),(3*n-i):-1:(n+1-i),...
        ones(1,n-i)*(n+1-i),(n+2-i):n]';
    x_row_b=[ones(1,n+1-i)*(n+1-i),(n+2-i):(3*n+1-i),ones(1,i)*(3*n+1-i),...
        (3*n-i):-1:(n+2-i)]';
    x_row_c=[(2*n+1-i):-1:(n+1-i),ones(1,n-i)*(n+1-i),(n+2-i):(3*n+1-i),...
        ones(1,i)*(3*n+1-i),(3*n-i):-1:(2*n+2-i)]';
    templist=generate_sequence3(2,n-1);
    x_col_x=[templist(i):n*5,1:(templist(i)-1)]';
    clear templist;
    x_col_y=[zeros(1,n-i),generate_sequence(i)+4*n-i,...
        generate_sequence9(n,i),zeros(1,n+i-1),generate_sequence10(n,i),...
        generate_sequence11(n,i),zeros(1,n-1)]';
    x_col_z=[n+1+i,zeros(1,2*n-1-i),generate_sequence(n+1)+4*n-i,...
        zeros(1,n-1+i),generate_sequence12(n,i)]';
    x_col_a=[generate_sequence13(n,i),zeros(1,2*n-1-i),...
        generate_sequence14(n,i),zeros(1,n-1+i)]';
    x_col_b=[zeros(1,n),generate_sequence13(n,i),zeros(1,2*n-1-i),...
        generate_sequence14(n,i),zeros(1,i-1)]';
    x_col_c=[generate_sequence15(n,i),zeros(1,n-1+i),...
        generate_sequence13(n,i),zeros(1,2*n-1-i),generate_sequence16(n,i)]';
    lists{end+1}=[x_row_x,x_row_y,x_row_z,x_row_a,x_row_b,x_row_c,...
        x_col_x,x_col_y,x_col_z,x_col_a,x_col_b,x_col_c];
end

for i=n:-1:1
    x_row_x=ones(i*5,1)*(3*n+1-i);
    x_row_y=[(n+1+(n-i)):3*n+1-(n-i),3*n-(n-i):-1:(n+1)+(n-i),ones(1,i-1)*(n+1)+(n-i)]';
    x_row_z=[ones(1,i+1)*(n+1+(n-i)),(n+2+(n-i)):3*n+1-(n-i),2*n+i:-1:(n+2+(n-i))]';
    x_row_a=[(n+1):(i+n+1),ones(1,i)*(i+n+1),(i+n):-1:(n+1-i),(n+2-i):n]';
    x_row_b=[(n+1-i):(n+1+i),ones(1,i)*(n+1+i),(n+i):-1:(n+2-i)]';
    x_row_c=[(n+1):-1:(n+1-i),(n+2-i):(n+1+i),ones(1,i)*(n+1+i),(n+i):-1:n+2]';
    if i==n
        x_col_x=[(ceil(n/2)+1):5*n,1:ceil(n/2)]';
    else
        x_col_x=zeros(5*i,1);
    end
    
    x_col_y=[generate_sequence17(n,i),zeros(1,2*i-1),generate_sequence18(n,i),...
        generate_sequence19(n,i)]';
    x_col_z=[generate_sequence19(n,i),generate_sequence17(n,i),...
        zeros(1,2*i-1),generate_sequence18(n,i)]';
    x_col_a=[generate_sequence20(n,i),generate_sequence21(n,i),...
        generate_sequence22(n,i),zeros(1,2*i-1)]';
    x_col_b=[zeros(1,i),generate_sequence20(n,i),generate_sequence21(n,i),...
        generate_sequence22(n,i),zeros(1,i-1)]';
    x_col_c=[2*n+1+(n-i),zeros(1,2*i-1),generate_sequence23(n,i),...
        generate_sequence24(n,i),generate_sequence25(n,i)]';
    lists{end+1}=[x_row_x,x_row_y,x_row_z,x_row_a,x_row_b,x_row_c,...
         x_col_x,x_col_y,x_col_z,x_col_a,x_col_b,x_col_c];
end

clear x_row_x x_row_y x_row_z x_row_a x_row_b x_row_c;
clear x_col_x x_col_y x_col_z x_col_a x_col_b x_col_c;
lists{end+1}=[3*n+1, 2*n+1, 2*n+1, n+1, n+1, n+1, ...
    0, 2*n+1+ceil(n/2),2*n+1+ceil(n/2),3*n+1,3*n+1,3*n+1];

all_coords=[];
for i=1:length(lists)
    all_coords=[all_coords;lists{i}];
end
clear lists;

%% End of coordinates generator

%% Integrity test
% cylx=[];
% cyly=[];
% cylz=[];
% cyla=[];
% cylb=[];
% cylc=[];
% for i=1:length(all_coords)
%     if all_coords(i,1)>=n+1 && all_coords(i,1)<=2*n+1
%     cylx=[cylx;all_coords(i,:)];
%     end
% end
% cylx=sortrows(cylx,7);
% 
% for i=1:length(all_coords)
%     if all_coords(i,2)>=n+1 && all_coords(i,2)<=2*n+1
%     cyly=[cyly;all_coords(i,:)];
%     end
% end
% cyly=sortrows(cyly,8);
% 
% for i=1:length(all_coords)
%     if all_coords(i,3)>=n+1 && all_coords(i,3)<=2*n+1
%     cylz=[cylz;all_coords(i,:)];
%     end
% end
% cylz=sortrows(cylz,9);
% 
% for i=1:length(all_coords)
%     if all_coords(i,4)>=n+1 && all_coords(i,4)<=2*n+1
%     cyla=[cyla;all_coords(i,:)];
%     end
% end
% cyla=sortrows(cyla,10);
% 
% for i=1:length(all_coords)
%     if all_coords(i,5)>=n+1 && all_coords(i,5)<=2*n+1
%     cylb=[cylb;all_coords(i,:)];
%     end
% end
% cylb=sortrows(cylb,11);
% 
% for i=1:length(all_coords)
%     if all_coords(i,6)>=n+1 && all_coords(i,6)<=2*n+1
%     cylc=[cylc;all_coords(i,:)];
%     end
% end
% cylc=sortrows(cylc,12);
% 
% counts = [groupcounts(cylx(:,7)),groupcounts(cyly(:,8)),...
%     groupcounts(cylz(:,9)),groupcounts(cyla(:,10)),...
%     groupcounts(cylb(:,11)),groupcounts(cylc(:,12))];

%% The ALGORITHM
function answer=alg_shortest(x1,y1,x2,y2,n)
    source=[x1,y1];
destination=[x2,y2];

if (mod(source(1),2)==0)
    source(2)=source(2)*2-1;
else
    source(2)=source(2)*2;
end

if (mod(destination(1),2)==0)
    destination(2)=destination(2)*2-1;
else
    destination(2)=destination(2)*2;
end
%(even,even) or (odd,odd) for (x,y) is illegal at this point
a=abs(source(1)-destination(1));
b=abs(source(2)-destination(2));
b_cir=min([b,abs(5*n*2-b)]);


% Calculate the angle in radians first
theta_rad = atan2(a, b_cir);

% Convert radians to degrees
theta_deg = theta_rad * (180 / pi);

if theta_deg<45
    answer=(a+b_cir)/2;
    %disp(['The shortest distance is ', num2str(answer)]);
else
    answer=a;
    %disp(['The shortest distance is ', num2str(a)]);
end
end

%% finding all pairs
pair_indices = nchoosek(1:size(all_coords, 1), 2);

% Use the indices to get the coordinate pairs
all_pairs = [all_coords(pair_indices(:, 1), :), all_coords(pair_indices(:, 2), :)];

clear pair_indices;

all_pairs(:,end+1)=zeros(length(all_pairs),1);

for i=1:length(all_pairs)

point_A=all_pairs(i,1:12);
point_B=all_pairs(i,13:24);%[6,5,3,6,3,3];


isARowPresentx = point_A(1)>=n+1 && point_A(1)<=2*n+1;
isBRowPresentx = point_B(1)>=n+1 && point_B(1)<=2*n+1;
isARowPresenty = point_A(2)>=n+1 && point_A(2)<=2*n+1;
isBRowPresenty = point_B(2)>=n+1 && point_B(2)<=2*n+1;
isARowPresentz = point_A(3)>=n+1 && point_A(3)<=2*n+1;
isBRowPresentz = point_B(3)>=n+1 && point_B(3)<=2*n+1;
isARowPresenta = point_A(4)>=n+1 && point_A(4)<=2*n+1;
isBRowPresenta = point_B(4)>=n+1 && point_B(4)<=2*n+1;
isARowPresentb = point_A(5)>=n+1 && point_A(5)<=2*n+1;
isBRowPresentb = point_B(5)>=n+1 && point_B(5)<=2*n+1;
isARowPresentc = point_A(6)>=n+1 && point_A(6)<=2*n+1;
isBRowPresentc = point_B(6)>=n+1 && point_B(6)<=2*n+1;

answer_vec=inf(1,6);
if isARowPresentx && isBRowPresentx %&& point_A(7)~=0 && point_B(7)~=0
    %disp("x cylinder path");
    x1=point_A(1)-n; y1=point_A(7);
    x2=point_B(1)-n; y2=point_B(7);
    answer_vec(1)=alg_shortest(x1,y1,x2,y2,n);
end
if isARowPresenty && isBRowPresenty %&& point_A(8)~=0 && point_B(8)~=0
    %disp("y cylinder path");
    x1=point_A(2)-n; y1=point_A(8);
    x2=point_B(2)-n; y2=point_B(8);
    answer_vec(2)=alg_shortest(x1,y1,x2,y2,n);
end
if isARowPresentz && isBRowPresentz %&& point_A(9)~=0 && point_B(9)~=0
    %disp("z cylinder path");
    x1=point_A(3)-n; y1=point_A(9);
    x2=point_B(3)-n; y2=point_B(9);
    answer_vec(3)=alg_shortest(x1,y1,x2,y2,n);
end
if isARowPresenta && isBRowPresenta %&& point_A(10)~=0 && point_B(10)~=0
    %disp("a cylinder path");
    x1=point_A(4)-n; y1=point_A(10);
    x2=point_B(4)-n; y2=point_B(10);
    answer_vec(4)=alg_shortest(x1,y1,x2,y2,n);
end
if isARowPresentb && isBRowPresentb %&& point_A(11)~=0 && point_B(11)~=0
    %disp("b cylinder path");
    x1=point_A(5)-n; y1=point_A(11);
    x2=point_B(5)-n; y2=point_B(11);
    answer_vec(5)=alg_shortest(x1,y1,x2,y2,n);
end
if isARowPresentc && isBRowPresentc %&& point_A(12)~=0 && point_B(12)~=0
    %disp("c cylinder path");
    x1=point_A(6)-n; y1=point_A(12);
    x2=point_B(6)-n; y2=point_B(12);
    answer_vec(6)=alg_shortest(x1,y1,x2,y2,n);
end



all_pairs(i,end)=min(answer_vec);
end

simpleform_all_pairs_with_ans=all_pairs(:,[1:3,13:15,25]);
% [elementCounts, uniqueElements] = groupcounts(...
%     simpleform_all_pairs_with_ans(:,7)); % Group and count elements
% 
% % Display results
% disp(table(uniqueElements, elementCounts, 'VariableNames', {'Element', 'Count'}));
clear all_pairs isARowPresenta isARowPresentb isARowPresentc ...
    isARowPresentx isARowPresenty isARowPresentz isBRowPresenta...
    isBRowPresentb isBRowPresentc isBRowPresentx isBRowPresenty...
    isBRowPresentz point_A point_B x1 x2 y1 y2 i answer_vec;