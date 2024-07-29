close all
% 设置随机数种子（可选）
rng(0);

% 类别数量
numClasses = 20;

% 每个类别的数据点数量
numPointsPerClass = 10000;

% 数据维度
dim = 50;

% 初始化数据矩阵和标签向量
data = [];
labels = [];

% 设置每个类别的均值和协方差矩阵
mu = randn(numClasses, dim); % 每行代表一个类别的均值
sigma = repmat(eye(dim), [1, 1, numClasses]); % 每个类别的协方差矩阵（单位矩阵）

% 生成数据
for i = 1:numClasses
    % 生成第i类的数据
    dataClass = mvnrnd(mu(i,:), sigma(:,:,i), numPointsPerClass);
    % 生成标签
    labelsClass = i * ones(numPointsPerClass, 1);
    % 追加到数据矩阵和标签向量中
    X = [X; dataClass];
    Y = [Y; labelsClass];
end

% 由于数据维度过高，无法直接在二维空间中可视化，因此仅打印数据规模
disp('生成的高斯分布数据：');
disp(['数据点数量: ', num2str(size(X, 1))]);
disp(['数据维度: ', num2str(size(X, 2))]);
disp(['类别数量: ', num2str(numClasses)]);
save toydata.mat X Y
