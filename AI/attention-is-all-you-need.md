# Attention Is All You Need: A Comprehensive Knowledge Base

## Table of Contents

1. Document Overview
2. Introduction
3. Background
4. Model Architecture
   4.1 Encoder and Decoder Stacks
   4.2 Attention
   4.3 Position-wise Feed-Forward Networks
   4.4 Embeddings and Softmax
   4.5 Positional Encoding
5. Why Self-Attention
6. Training
   6.1 Training Data and Batching
   6.2 Hardware and Schedule
   6.3 Optimizer
   6.4 Regularization
7. Results
   7.1 Machine Translation
   7.2 Model Variations
   7.3 English Constituency Parsing
8. Conclusion
9. References and Further Reading

## 1. Document Overview

This knowledge base entry is based on the seminal paper "Attention Is All You Need" by Ashish Vaswani et al., published in 2017. The paper introduces the Transformer, a novel neural network architecture for sequence transduction tasks that relies entirely on attention mechanisms, dispensing with recurrence and convolutions. This groundbreaking work has had a significant impact on the field of natural language processing and machine learning.

The document presents a new approach to sequence modeling and transduction problems, such as language translation, that achieves state-of-the-art performance while being more parallelizable and requiring significantly less training time than previous methods. The Transformer model introduced in this paper has become the foundation for many subsequent developments in NLP, including models like BERT, GPT, and their variants.

## 2. Introduction

The authors begin by highlighting the dominance of recurrent and convolutional neural networks in sequence modeling and transduction tasks. They note the limitations of these approaches, particularly in terms of parallelization and computational efficiency for long sequences. The paper then introduces the Transformer as a new architecture that addresses these limitations.

<quote>We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely.</quote>

Key points from the introduction:

- The Transformer achieves superior quality in translation tasks while being more parallelizable and requiring significantly less training time.
- On the WMT 2014 English-to-German translation task, the Transformer outperforms the best previously reported models by over 2 BLEU points.
- On the WMT 2014 English-to-French translation task, the model establishes a new single-model state-of-the-art BLEU score of 41.8.
- The Transformer generalizes well to other tasks, as demonstrated by its successful application to English constituency parsing.

## 3. Background

The authors provide context for their work by discussing recent developments in sequence modeling and transduction. They highlight the following key points:

1. Recurrent neural networks (RNNs), particularly Long Short-Term Memory (LSTM) and Gated Recurrent Unit (GRU) networks, have been the dominant approaches in sequence modeling.

2. The sequential nature of RNNs precludes parallelization within training examples, which becomes a critical limitation for longer sequence lengths.

3. Attention mechanisms have become an integral part of compelling sequence modeling and transduction models, allowing for modeling of dependencies without regard to their distance in the input or output sequences.

4. Previous work has mostly used attention mechanisms in conjunction with a recurrent network.

The authors cite several relevant works that have aimed to reduce sequential computation:

<quote>The goal of reducing sequential computation also forms the foundation of the Extended Neural GPU, ByteNet and ConvS2S, all of which use convolutional neural networks as basic building block, computing hidden representations in parallel for all input and output positions.</quote>

They note that while these approaches have made progress, they still face challenges in learning dependencies between distant positions.

## 4. Model Architecture

The Transformer follows an encoder-decoder architecture using stacked self-attention and point-wise, fully connected layers for both the encoder and decoder. This section details the components of the model.

### 4.1 Encoder and Decoder Stacks

<quote>Encoder: The encoder is composed of a stack of N = 6 identical layers. Each layer has two sub-layers. The first is a multi-head self-attention mechanism, and the second is a simple, position-wise fully connected feed-forward network. We employ a residual connection around each of the two sub-layers, followed by layer normalization. That is, the output of each sub-layer is LayerNorm(x + Sublayer(x)), where Sublayer(x) is the function implemented by the sub-layer itself.</quote>

<quote>Decoder: The decoder is also composed of a stack of N = 6 identical layers. In addition to the two sub-layers in each encoder layer, the decoder inserts a third sub-layer, which performs multi-head attention over the output of the encoder stack. Similar to the encoder, we employ residual connections around each of the sub-layers, followed by layer normalization. We also modify the self-attention sub-layer in the decoder stack to prevent positions from attending to subsequent positions. This masking, combined with fact that the output embeddings are offset by one position, ensures that the predictions for position i can depend only on the known outputs at positions less than i.</quote>

Key features:
- Both encoder and decoder have 6 identical layers
- Each layer uses residual connections and layer normalization
- The decoder has an additional sub-layer for attention over the encoder output
- The decoder uses masking to prevent attending to future positions

### 4.2 Attention

The authors describe attention as a function that maps a query and a set of key-value pairs to an output. The output is computed as a weighted sum of the values, where the weight assigned to each value is computed by a compatibility function of the query with the corresponding key.

They introduce "Scaled Dot-Product Attention" and "Multi-Head Attention" as key components of their model.

<quote>Scaled Dot-Product Attention: We call our particular attention "Scaled Dot-Product Attention". The input consists of queries and keys of dimension dk, and values of dimension dv. We compute the dot products of the query with all keys, divide each by √dk, and apply a softmax function to obtain the weights on the values.</quote>

The formula for Scaled Dot-Product Attention is given as:

<quote>Attention(Q, K, V) = softmax(QK^T / √dk)V</quote>

<quote>Multi-Head Attention: Instead of performing a single attention function with dmodel-dimensional keys, values and queries, we found it beneficial to linearly project the queries, keys and values h times with different, learned linear projections to dk, dk and dv dimensions, respectively. On each of these projected versions of queries, keys and values we then perform the attention function in parallel, yielding dv-dimensional output values. These are concatenated and once again projected, resulting in the final values.</quote>

The authors note that Multi-Head Attention allows the model to jointly attend to information from different representation subspaces at different positions, which is beneficial for the model's performance.

### 4.3 Position-wise Feed-Forward Networks

In addition to attention sub-layers, each layer in the encoder and decoder contains a fully connected feed-forward network, applied to each position separately and identically. This consists of two linear transformations with a ReLU activation in between.

<quote>FFN(x) = max(0, xW1 + b1)W2 + b2</quote>

The dimensionality of input and output is dmodel = 512, and the inner-layer has dimensionality dff = 2048.

### 4.4 Embeddings and Softmax

The model uses learned embeddings to convert input tokens and output tokens to vectors of dimension dmodel. It also uses the usual learned linear transformation and softmax function to convert the decoder output to predicted next-token probabilities.

<quote>In our model, we share the same weight matrix between the two embedding layers and the pre-softmax linear transformation, similar to. In the embedding layers, we multiply those weights by √dmodel.</quote>

### 4.5 Positional Encoding

Since the model contains no recurrence and no convolution, it must inject some information about the relative or absolute position of the tokens in the sequence. To this end, the authors add "positional encodings" to the input embeddings at the bottoms of the encoder and decoder stacks.

<quote>We use sine and cosine functions of different frequencies:

PE(pos,2i) = sin(pos/10000^(2i/dmodel))
PE(pos,2i+1) = cos(pos/10000^(2i/dmodel))

where pos is the position and i is the dimension.</quote>

The authors chose this function because they hypothesized it would allow the model to easily learn to attend by relative positions, since for any fixed offset k, PEpos+k can be represented as a linear function of PEpos.

## 5. Why Self-Attention

The authors provide a detailed comparison of self-attention layers to recurrent and convolutional layers, considering three aspects:

1. Total computational complexity per layer
2. Amount of computation that can be parallelized
3. Path length between long-range dependencies in the network

They present a table comparing these aspects for different layer types, showing that self-attention layers have advantages in terms of computational complexity and parallelization, especially for shorter sequences.

<quote>As noted in Table 1, a self-attention layer connects all positions with a constant number of sequentially executed operations, whereas a recurrent layer requires O(n) sequential operations. In terms of computational complexity, self-attention layers are faster than recurrent layers when the sequence length n is smaller than the representation dimensionality d, which is most often the case with sentence representations used by state-of-the-art models in machine translations, such as word-piece and byte-pair representations.</quote>

The authors also note that self-attention could yield more interpretable models, as attention distributions often exhibit behavior related to the syntactic and semantic structure of the sentences.

## 6. Training

### 6.1 Training Data and Batching

<quote>We trained on the standard WMT 2014 English-German dataset consisting of about 4.5 million sentence pairs. Sentences were encoded using byte-pair encoding, which has a shared source-target vocabulary of about 37000 tokens. For English-French, we used the significantly larger WMT 2014 English-French dataset consisting of 36M sentences and split tokens into a 32000 word-piece vocabulary.</quote>

### 6.2 Hardware and Schedule

<quote>We trained our models on one machine with 8 NVIDIA P100 GPUs. For our base models using the hyperparameters described throughout the paper, each training step took about 0.4 seconds. We trained the base models for a total of 100,000 steps or 12 hours. For our big models,(described on the bottom line of table 3), step time was 1.0 seconds. The big models were trained for 300,000 steps (3.5 days).</quote>

### 6.3 Optimizer

The authors used the Adam optimizer with β1 = 0.9, β2 = 0.98 and ε = 10^-9. They varied the learning rate over the course of training according to a specific formula:

<quote>lrate = d^(-0.5)_model · min(step_num^(-0.5), step_num · warmup_steps^(-1.5))</quote>

This corresponds to increasing the learning rate linearly for the first warmup_steps training steps, and decreasing it thereafter proportionally to the inverse square root of the step number. They used warmup_steps = 4000.

### 6.4 Regularization

The authors employed three types of regularization during training:

1. Residual Dropout: Applied to the output of each sub-layer, before it is added to the sub-layer input and normalized. Also applied to the sums of the embeddings and the positional encodings in both the encoder and decoder stacks. For the base model, they used a rate of Pdrop = 0.1.

2. Label Smoothing: They employed label smoothing of value εls = 0.1 during training. They note that this hurts perplexity, as the model learns to be more unsure, but improves accuracy and BLEU score.

## 7. Results

### 7.1 Machine Translation

The Transformer model achieved state-of-the-art results on both the WMT 2014 English-to-German and English-to-French translation tasks:

<quote>On the WMT 2014 English-to-German translation task, the big transformer model (Transformer (big) in Table 2) outperforms the best previously reported models (including ensembles) by more than 2.0 BLEU, establishing a new state-of-the-art BLEU score of 28.4.</quote>

<quote>On the WMT 2014 English-to-French translation task, our big model achieves a BLEU score of 41.0, outperforming all of the previously published single models, at less than 1/4 the training cost of the previous state-of-the-art model.</quote>

The authors provide a detailed table (Table 2 in the paper) comparing the Transformer's performance to other models, including training costs.

### 7.2 Model Variations

The authors conducted experiments with various model configurations to evaluate the importance of different components. They present these results in Table 3 of the paper, showing the effects of varying parameters such as the number of attention heads, key and value dimensions, model size, and dropout rate.

Some key findings from these variations:

- Single-head attention is 0.9 BLEU worse than the best setting, but quality also drops off with too many heads.
- Reducing the attention key size hurts model quality, suggesting that determining compatibility is not easy and that a more sophisticated compatibility function than dot product may be beneficial.
- Bigger models perform better, and dropout is very helpful in avoiding over-fitting.
- Learned positional embeddings perform nearly identically to sinusoidal positional encodings.

### 7.3 English Constituency Parsing

To evaluate the Transformer's ability to generalize to other tasks, the authors applied it to English constituency parsing. They trained a 4-layer Transformer with dmodel = 1024 on the Wall Street Journal (WSJ) portion of the Penn Treebank, consisting of about 40K training sentences.

<quote>Our results in Table 4 show that despite the lack of task-specific tuning our model performs surprisingly well, yielding better results than all previously reported models with the exception of the Recurrent Neural Network Grammar.</quote>

The Transformer outperformed the Berkeley-Parser even when training only on the WSJ training set of 40K sentences, in contrast to RNN sequence-to-sequence models.

## 8. Conclusion

The authors conclude by summarizing the key contributions of their work:

<quote>In this work, we presented the Transformer, the first sequence transduction model based entirely on attention, replacing the recurrent layers most commonly used in encoder-decoder architectures with multi-headed self-attention.</quote>

They highlight the Transformer's advantages:
- Can be trained significantly faster than architectures based on recurrent or convolutional layers
- Achieves new state of the art in translation quality
- Generalizes well to other tasks, such as English constituency parsing

The authors express excitement about the future of attention-based models and outline plans for future work:

<quote>We are excited about the future of attention-based models and plan to apply them to other tasks. We plan to extend the Transformer to problems involving input and output modalities other than text and to investigate local, restricted attention mechanisms to efficiently handle large inputs and outputs such as images, audio and video. Making generation less sequential is another research goals of ours.</quote>

## 9. References and Further Reading

The paper includes an extensive list of references, which are crucial for understanding the context and related work. Some key references include:

1. Bahdanau, D., Cho, K., & Bengio, Y. (2014). Neural machine translation by jointly learning to align and translate. arXiv preprint arXiv:1409.0473.

2. Cho, K., Van Merriënboer, B., Gulcehre, C., Bahdanau, D., Bougares, F., Schwenk, H., & Bengio, Y. (2014). Learning phrase representations using RNN encoder-decoder for statistical machine translation. arXiv preprint arXiv:1406.1078.

3. Gehring, J., Auli, M., Grangier, D., Yarats, D., & Dauphin, Y. N. (2017). Convolutional sequence to sequence learning. arXiv preprint arXiv:1705.03122v2.

4. Sutskever, I., Vinyals, O., & Le, Q. V. (2014). Sequence to sequence learning with neural networks. In Advances in neural information processing systems (pp. 3104-3112).

5. Wu, Y., Schuster, M., Chen, Z., Le, Q. V., Norouzi, M., Macherey, W., ... & Dean, J. (2016). Google's neural machine translation system: Bridging the gap between human and machine translation. arXiv preprint arXiv:1609.08144.

