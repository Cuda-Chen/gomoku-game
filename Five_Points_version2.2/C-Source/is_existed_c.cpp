/*
#include <mex.h>
#include <stdio.h>
#define MAXSIZE 113
void main()
{
	int Current_Step[1][2] = {2,3};
	int Step_Set[MAXSIZE][2] = {1,3,3,4,4,5,2,3};
	int i,j;
	int flag = 0;


	for (i = 0; i <= MAXSIZE - 1; i ++)
	{
		for(j = 0; j <= 1; j++)
			printf("%d ",Step_Set[i][j]);
		printf("\n");
	}

	for(i = 0; i <= MAXSIZE - 1; i ++)
	{
		if ((Step_Set[i][0] ==Current_Step[0][0]) && (Step_Set[i][1] ==Current_Step[0][1]))
		{
			flag = 1;
			break;
		}
	}
	printf("flag = %d\n i = %d\n",flag,i);
	return ;
}*/
#include <mex.h>
#include <matrix.h>
#include <stdlib.h>
#include <stdio.h>
#define MAXSIZE 113
void mexFunction(
							int					nlhs,
							mxArray             *plhs[],
							int					nrhs,
							const mxArray       *prhs[] )
{
	bool				*flag;
	int				i;
    int                 j;
    int                 temp_x;
    int                 temp_y;
	double			*Current_Step;
	double			*Step_Set;
	Current_Step	= mxGetPr(prhs[0]);
	Step_Set		= mxGetPr(prhs[1]);
    plhs[0]			= mxCreateLogicalMatrix(1, 1);
	flag               = mxGetPr(plhs[0]);
	
	for(i = 0; i < MAXSIZE; i ++)
    {
        temp_x = (int)*(Step_Set + i);
        temp_y = (int)*(Step_Set + i + MAXSIZE);
     printf("%d %d\n",temp_x,temp_y);
        if (temp_x == (int)*Current_Step && temp_y == (int)*(Current_Step + 1))
            *flag = 1;
	}
	return;
}
