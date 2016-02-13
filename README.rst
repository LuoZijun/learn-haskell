Haskell练习
===============

:Date: 02/13 2016

.. contents::

官网: https://www.haskell.org/


包:   https://hackage.haskell.org/


学习资料:

*   `Real World Haskell 中文版 <http://cnhaskell.com/index.html>`_
*   `Real World Haskell 英文原版 <http://book.realworldhaskell.org/read/>`_

安装环境
-----------

安装 Haskell 编译器:

.. code:: bash

    # OS X
    brew install ghc
    # Linux (Debian)
    sudo apt-get install ghc ghci

安装 Hackage 包管理器 opam:

.. code:: bash

    # OS X
    brew install opam
    opam update
    opam install core network


代码编译
-----------

编译二进制或者字节码:

.. code:: bash

    ghc -o helloworld helloworld.hs

进入解释器交互模式:

.. code:: bash

    ghci


Haskell 操作符 以及 语法标记
----------------------------

`Haskell Operators and other Lexical Notation <http://www.imada.sdu.dk/~rolf/Edu/DM22/F06/haskell-operatorer.pdf>`_


    -- Start of comment line
    {- Start of short comment
    -} End of short comment
    + Add operator
    - Subtract/negate operator
    * Multiply operator
    / Division operator
    Substitution operator, as in e{f/x}
    ^, ^^, ** Raise-to-the-power operators
    && And operator
    || Or operator
    < Less-than operator
    <= Less-than-or-equal operator
    == Equal operator
    /= Not-equal operator
    >= Greater-than-or-equal operator
    > Greater-than operator
    \ Lambda operator
    . Function composition operator
    Name qualifier
    | Guard and case specifier
    Separator in list comprehension
    Alternative in data definition (enum type)
    ++ List concatenation operator
    : Append-head operator (“cons”)
    !! Indexing operator
    .. Range-specifier for lists
    \\ List-difference operator
    <- List comprehension generator
    Single assignment operator in do-constr.
    ; Definition separator
    -> Function type-mapping operator.
    Lambda definition operator
    Separator in case construction
    = Type- or value-naming operator
    :: Type specification operator, “has type”
    => Context inheritance from class
    () Empty value in IO () type
    >> Monad sequencing operator
    >>= Monad sequencing operator with value passing
    >@> Object composition operator (monads)
    (..) Constructor for export operator (postfix)
    [ and ] List constructors, “,” as separator
    ( and ) Tuple constructors, “,” as separator
    Infix-to-prefix constructors
    ‘ and ‘ Prefix-to-infix constructors
    ’ and ’ Literal char constructors
    " and " String constructors
    _ Wildcard in pattern
    ~ Irrefutable pattern
    ! Force evaluation (strictness flag)
    @ “Read As” in pattern matching



你好，世界
------------

.. code:: haskell
    
    import System.IO

    main = do
        System.IO.putStrLn "Hello, 世界！"
        System.IO.putStr "Hello, 世界！\n"


