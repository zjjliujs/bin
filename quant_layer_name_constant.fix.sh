#/bin/bash
sed -i 's/"ReLU"/LAYER_ReLU/g' $1
sed -i 's/"PadChannel"/LAYER_PadChannel/g' $1
sed -i 's/"PriorBox"/LAYER_PriorBox/g' $1
sed -i 's/"PReLU"/LAYER_PReLU/g' $1
sed -i 's/"InnerProduct"/LAYER_InnerProduct/g' $1
sed -i 's/"Cos"/LAYER_Cos/g' $1
sed -i 's/"Log"/LAYER_Log/g' $1
sed -i 's/"Swish"/LAYER_Swish/g' $1
sed -i 's/"ELU"/LAYER_ELU/g' $1
sed -i 's/"TanH"/LAYER_TanH/g' $1
sed -i 's/"PSROIPooling"/LAYER_PSROIPooling/g' $1
sed -i 's/"Normalize"/LAYER_Normalize/g' $1
sed -i 's/"Flatten"/LAYER_Flatten/g' $1
sed -i 's/"Sigmoid"/LAYER_Sigmoid/g' $1
sed -i 's/"CenterLoss"/LAYER_CenterLoss/g' $1
sed -i 's/"Pooling"/LAYER_Pooling/g' $1
sed -i 's/"Yolov3DetectionOutput"/LAYER_Yolov3DetectionOutput/g' $1
sed -i 's/"LSTMType1"/LAYER_LSTMType1/g' $1
sed -i 's/"DetectionEvaluate"/LAYER_DetectionEvaluate/g' $1
sed -i 's/"UpsampleBN"/LAYER_UpsampleBN/g' $1
sed -i 's/"Exp"/LAYER_Exp/g' $1
sed -i 's/"Deconvolution"/LAYER_Deconvolution/g' $1
sed -i 's/"AbsVal"/LAYER_AbsVal/g' $1
sed -i 's/"Sin"/LAYER_Sin/g' $1
sed -i 's/"GRUScale"/LAYER_GRUScale/g' $1
sed -i 's/"LRN"/LAYER_LRN/g' $1
sed -i 's/"ContrastiveLoss"/LAYER_ContrastiveLoss/g' $1
sed -i 's/"BNLL"/LAYER_BNLL/g' $1
sed -i 's/"BNScale"/LAYER_BNScale/g' $1
sed -i 's/"Reshape"/LAYER_Reshape/g' $1
sed -i 's/"MultinomialLogisticLoss"/LAYER_MultinomialLogisticLoss/g' $1
sed -i 's/"SmotthL1Loss"/LAYER_SmotthL1Loss/g' $1
sed -i 's/"Concat"/LAYER_Concat/g' $1
sed -i 's/"InfogainLoss"/LAYER_InfogainLoss/g' $1
sed -i 's/"Slice"/LAYER_Slice/g' $1
sed -i 's/"EuclideanLoss"/LAYER_EuclideanLoss/g' $1
sed -i 's/"ReLU6"/LAYER_ReLU6/g' $1
sed -i 's/"Tile"/LAYER_Tile/g' $1
sed -i 's/"LReLU"/LAYER_LReLU/g' $1
sed -i 's/"Sqrt"/LAYER_Sqrt/g' $1
sed -i 's/"GRUHScale"/LAYER_GRUHScale/g' $1
sed -i 's/"MultiBoxLoss"/LAYER_MultiBoxLoss/g' $1
sed -i 's/"HingeLoss"/LAYER_HingeLoss/g' $1
sed -i 's/"Eltwise"/LAYER_Eltwise/g' $1
sed -i 's/"LSTMInfer"/LAYER_LSTMInfer/g' $1
sed -i 's/"AnnotatedData"/LAYER_AnnotatedData/g' $1
sed -i 's/"Softmax"/LAYER_Softmax/g' $1
sed -i 's/"Upsample"/LAYER_Upsample/g' $1
sed -i 's/"VideoData"/LAYER_VideoData/g' $1
sed -i 's/"SELU"/LAYER_SELU/g' $1
sed -i 's/"Convolution"/LAYER_Convolution/g' $1
sed -i 's/"PriorBoxS"/LAYER_PriorBoxS/g' $1
sed -i 's/"NormalizeL"/LAYER_NormalizeL/g' $1
sed -i 's/"LSTMInferScale"/LAYER_LSTMInferScale/g' $1
sed -i 's/"Data"/LAYER_Data/g' $1
sed -i 's/"Permute"/LAYER_Permute/g' $1
sed -i 's/"Power"/LAYER_Power/g' $1
sed -i 's/"Python"/LAYER_Python/g' $1
sed -i 's/"GRU"/LAYER_GRU/g' $1
sed -i 's/"Dropout"/LAYER_Dropout/g' $1
sed -i 's/"Reduction"/LAYER_Reduction/g' $1
sed -i 's/"CReLU"/LAYER_CReLU/g' $1
sed -i 's/"DepthwiseConvolution"/LAYER_DepthwiseConvolution/g' $1
sed -i 's/"ImageData"/LAYER_ImageData/g' $1
sed -i 's/"DetectionOutput"/LAYER_DetectionOutput/g' $1
sed -i 's/"SoftmaxWithLoss"/LAYER_SoftmaxWithLoss/g' $1
sed -i 's/"Input"/LAYER_Input/g' $1
sed -i 's/"Accuracy"/LAYER_Accuracy/g' $1
