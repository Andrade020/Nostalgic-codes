#include<stdio.h>
#include<string.h>
#include<stdlib.h>
//1tosse,
//2dor,
//3coceira.
//4manchas.
//5diarreia
//vomito
//struct, string, funcao, vetores e matrizes
int sp=0,ret, v;
char sinprim[89];
char nome[89];
float p, sol, liq;
char vanl[7],  cbca[7],cstas[7], gnta[7], test[7], anus[7], crpo[7], ovdo[7], tsse[7], lnga[7], mcha[7], clfr[7], fdga[7], abdm[7];
int cnt;
char doer[25];
char fb[5];
char ftar[5];
char olhs[5];
char diar[5];
char blha[5];
char drre[5];
int tosse(){
printf("\nVoce tem tido febre?");
scanf("%s",fb);
if(strcmp("sim", fb)==0){
        printf("\nvoce tem dores de cabeca?");
        scanf("%s", cbca);
            if(strcmp("sim", cbca)==0){
                printf("\ntem tido falta ou perda no apetite?  ");
                scanf("%s", vanl);
                if(strcmp("sim", vanl)==0){
                    printf("\nFEBRE TIFoIDE- Amoxicilina em Qualquer forma e Dose");
                }
                else{
                        printf("\nVoce tem tido prisao no ventre?");
                        scanf("%s", ovdo);
                        if(strcmp("sim", ovdo)==0){
                            printf("\nFEBRE TIFoIDE- Amoxicilina em Qualquer forma e Dose");
                        }
                        else{
                                printf("\nvoce tem tido vomitos ou diarreias?");
                                scanf("%s", diar);
                                if(strcmp("sim", diar)==0){
                               printf("\nLEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                                }
                                else{
                                    printf("\nGripe- repouso e ingestao de liquidos");
                                };
                        };
                };
            }
            else{
                    printf("\nVoce tem tido fadiga?");
                    scanf("%s", fdga);
                    if(strcmp("sim", fdga)==0){
                        printf("\nVoce tem sofrido perda de apetite?");
                            scanf("%s", anus);
                            if(strcmp("sim", anus)==0){
                                printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                            }
                            else{
                                printf("palidez??");
                                scanf("%s", tsse);
                                if(strcmp("sim", tsse)==0){
                                    printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                                }
                                else{
                                    printf("\nTem chiados no peito ou falta de ar?  ");
                                    scanf("%s", diar);
                                    if(strcmp("sim", diar)==0){
                                        printf("\nVOCE ESTA COM BRONQUITE\n");
                    printf("\nINJETAR 1 DOSE DE TAMISA 30 a cada 48 HORAS\n");
                                    }
                                    else{
                                            printf("\nGripe- repouso e ingestão de líquidos");
                                    };
                                };
                            };
                    }
                else{
                        printf("\nVoce tem falta de apetite?");
                        scanf("%s", lnga);
                        if(strcmp("sim", lnga)==0){
                            printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                        }
                        else{
                            printf("\nvoce tem tido palidez?");
                            scanf("%s", crpo);
                            if(strcmp("sim",crpo)==0){
                                printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                            }
                            else{
                                printf("\nvoce tem tido perda de peso?");
                                scanf("%s", mcha);
                                if(strcmp("sim",mcha)==0){
                                    printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                                }
                                else{
                                    printf("\nvoce tem rouquidao?");
                                    scanf("%s", gnta);
                                    if(strcmp("sim",gnta)==0){
                                        printf("\nTUBERCULOSE- %f mmg de ADINOS a cada 8 horas\n",sol );
                                    }
                                    else{
                                        printf("\nvoce tem tido espirros?");
                                        scanf("%s", abdm);
                                        if(strcmp("sim", abdm)==0){
                                            printf("\nVOCE ESTA COM COQUELUCHE/n");
                    printf("%f mmg de AZITROMICINA POR DIA \n", sol);
                                        }
                                        else{
                                            printf("\nvoce tem tido lacrimejacoes nos olhos?");
                                                scanf("%s", olhs);
                                                if(strcmp("sim", olhs)==0){
                                                        printf("\nVOCE ESTA COM COQUELUCHE\n");
                    printf("%f mmg de AZITROMICINA POR DIA \n", sol);
}
                                                else{
                                                    printf("voce tem tido prisao no ventre?(dificuldades de defecar)");
                                                    scanf("%s", blha);
                                                    if(strcmp("sim", blha)==0){
                                                        printf("FEBRE TIFoIDE- Amoxicilina em Qualquer forma e Dose");
                                                    }
                                                    else{
                                                            printf("Gripe- repouso e ingestao de liquidos");
                                                    };
                                                };
                                        };
                                    };
                                    };
                                };
                            };
                        };
                    };
}
else{
        printf("\nvoce tem tido dores de garganta?");
        scanf("%s",gnta);
        if(strcmp("sim", gnta)==0){
                printf("\nVoce tem tido dores de ouvido?");
                scanf("%s", ovdo);
                if(strcmp("sim", ovdo)==0){
                    printf("\nSiNUSITE-keflex %fgm \n", sol);
                }
                else{
                    printf("\nvoce tem tido dor no maxilar?");
                    scanf("%s", drre);
                    if(strcmp("sim", drre)==0){
                        printf("\nSiNUSITE-keflex %fgm \n", sol);
                    }
                    else{
                        printf("\nvoce tem tido nauseas?");
                        scanf("%s", cstas);
                        if(strcmp("sim", cstas)==0){
                            printf("\nSiNUSITE-keflex %fgm \n", sol);
                        }
                        else{
                            printf("\nvoce percebeu mau halito?");
                            scanf("%s", test);
                            if(strcmp("sim", test)==0){
                                printf("\nSiNUSITE-keflex %fgm \n", sol);
                            }
                            else{
                                printf("\nvoce esta com secrecoes?");
                                scanf("%s", ftar);
                                if(strcmp("sim", ftar)==0){
                                     printf("\nANTRAX- Bactoderm %f comprimidos ao dia \n", sol);
                                }
                                else{
                                    printf("\nvoce tem alguma bolha formada no peito?");
                                    scanf("%s", blha);
                                    if(strcmp("sim", blha)==0){
                                         printf("\nANTRAX- Bactoderm %f comprimidos ao dia \n", sol);
                                    }
                                    else{
                                            printf("\nGripe- repouso e ingestao de liquidos");
                                    };
                                };
                            };
                        };
                    };
                };
        }
        else{
            printf("\nvoce sente alguma fraqueza ou fadiga?");
            scanf("%s", fdga);
            if(strcmp("sim", fdga)==0){
                printf("\n SINUSITE- 5ml de KEFLEX antes de dormir\n");
            }
            else{
                printf("\nvoce tem dores de barriga, diarreias?");
                scanf("%s", abdm) ;
                if(strcmp("sim", abdm)==0){
                     printf("\nAncilostomiase-  Pantelmin- 100mg ao dia até curar\n");
                }
                else{
                    printf("\nvoce sente perdas de apetite?");
                    scanf("%s",cstas);
                    if(strcmp("sim", cstas)==0){
                         printf("\nAncilostomiase-  Pantelmin- 100mg ao dia até curar\n");
                    }
                    else{
                        printf("\nGripe- repouso e ingestao de liquidos");
                    };
                };
            };
        };
};
return 0;
};
int dores(){
     printf("\n Onde esta doendo? \n");
        while (cnt==0){
        scanf("%s", doer);
        if(strcmp(doer, "abdomen")==0){
            printf("\nHA CORRIMENTO VAGINAL OU PENIANO? \n ");
            scanf("%s", vanl);
            if(strcmp(vanl, "sim")==0){
                printf("\nCLAMIDIA- %fmmg a cada 6 horas \n\n",sol );
            }
            else{
                printf("\nTENS TIDO Diarreias ?\n");
                scanf("%s", drre);
                if(strcmp(drre, "sim")==0){
                    printf("\nVC TEM doenca de Whipple- %fml de Velija a Cada 12 HORAS\n\n\n", liq );
                }
                else{
                        printf("\n VOCE TEM TIDO CALAFRIOS?\n");
                        scanf("%s",gnta );
                        if(strcmp("sim", gnta)==0){
                            printf("ESCARLATINA- KEFLEX, 500mg \n\n\n");
                        }
                    else{
                        printf("Voce tem tido Febre?");
                        scanf("%s", fb);
                        if(strcmp("sim", fb)==0){
                            printf("BRUCELOSE- PARENZYME TETRACICLINA 500mg a cada 6h durante 3 semanas\n\n\n");
                        }
                        else{
                            printf("TEM TIDO DOR DE CABECA?");
                            scanf("%s", cbca);
                            if(strcmp(cbca, "sim")){
                                printf("Teniase- ATENASE, %fml de a cada 24 HORAS \n\n\n ", liq);
                            }
                            else{
                                printf("%f comprimidos de PATELMIN para ASCARIDIASE\n\n\n", liq);
                            };
                        };
                    };
                };
            };
            cnt=1;
        }
        else{
                if(strcmp(doer, "costas")==0){
                        printf("VOCÊ TEM TIDO DORES DE CABECA?");
                        scanf("%s", cbca);
                        if(strcmp("sim",cbca )==0){
                            printf("VOCE TEM BRUCELOSE- PARENDENZYME TETRACICLINA- 500mg para 6h durante 3semanas");
                        }
                        else{
                            printf("\nDISTENCAO MUSCULAR- RELAXE POR UMA SEMANA 🙂, SE QUISERES TOME UM COMPRIMIDO DE PARACETAMOL QUANDO A DOR SE INTENSIFICAR\n");
                        };
            cnt=1;
        }
        else{
                if(strcmp(doer, "cabeca")==0){
                    printf("\nTeve febre?");
scanf("%s",tsse);
if(strcmp("sim",tsse)==0){
    printf("\nesta tendo fadiga? ");
    scanf("%s", fdga);
    if(strcmp("sim", fdga)==0){
        printf("\nesta tendo sudorese? ");
        scanf("%s", cbca);
        if(strcmp("sim", cbca)==0){
            printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
        }
        else{
            printf("\nesta tendo dor nas costas? ");
            scanf("%s", cstas);
            if(strcmp("sim", cstas)==0){
                printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
            }
            else{
                printf("\nesta tendo dores nos musculos ou nas articulacoes? ");
                scanf("%s", drre);
                if(strcmp("sim", drre)==0){
                    printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
                }
                else{
                        printf("\nsofre perda de peso ou calafrios? ");
                        scanf("%s", doer);
                        if(strcmp("sim", doer)==0){
                            printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
                        }
                        else{
                            printf("\ntem manchas vermelhas pelo corpo? ");
                            scanf("%s", mcha);
                            if(strcmp("sim", mcha)==0){
                                printf("\nLYME- ceftriaxona sodica injetada\n");
                            }
                            else{
                                printf("\ntem tido dores de garganta? ");
                                scanf("%s", gnta);
                                if(strcmp("sim",gnta)==0){
                                    printf("\nDIAGNOSTICADO_-TOXOPLASMOSE_-16 COMPRIMIDOS DE ROVAMICINA 500mg\n");
                                }
                                else{
                                    printf("tem tido dores pelo corpo?");
                                    scanf("%s", test);
                                    if(strcmp("sim", test)==0){
                                        printf("\nDIAGNOSTICADO_-TOXOPLASMOSE_-16 COMPRIMIDOS DE ROVAMICINA 500mg\n");
                                    }
                                    else{
                                        printf("Gripe comum- Repouso e ingestao de liquidos");
                                    };
                                };
                            };
                        };
                };
            };
        };
    }
    else{
        printf("\ntem tido vomitos? ");
        scanf("%s", anus);
        if(strcmp("sim",anus)==0){
                printf("\nVoce teve dores pelo corpo? ");
                scanf("%s", anus);
                if(strcmp("sim",anus)==0){
                    printf("LEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                }
                else{
                    printf("\nvoce teve diarreias? ");
                    scanf("%s", diar);
                    if(strcmp("sim", diar)==0){
                        printf("LEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                    }
                    else{
                        printf("voce esta tossindo?");
                        scanf("%s", tsse);
                        if(strcmp("sim",tsse)==0){
                            printf("LEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                        }
                        else{
                            printf("\ntem rigidez no pescoco? ");
                            scanf("%s", vanl);
                            if(strcmp("sim", vanl)==0){
                                printf("\nDIAGNOSTICADO: MENINGITE-sulfato de polimixinaB- 45000UI/kg/dia- injetado por medico especializado\n");
                            }
                            else{
                                printf(" esta com nauseas? ");
                                scanf("%s", ovdo);
                                if(strcmp("sim", ovdo)==0){
                                    printf("\nDIAGNOSTICADO: MENINGITE-sulfato de polimixinaB- 45000UI/kg/dia- injetado por medico especializado\n");
                                }
                                else{
                                    printf("\nGripe comum- Repouso e ingestao de liquidos ");
                                }
                            };
                        };
                    };
                };
        }
        else{
                printf("\ntem tido dores no abdomen? ");
                scanf("%s", abdm);
                if(strcmp("sim",abdm)==0){
                        printf("\ntem suado a noite(sudorese)? ");
                        scanf("%s", lnga);
                        if(strcmp("sim", lnga)==0){
                        printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
                        }
                        else{
                            printf("\ntem tido dores nas costas? ");
                            scanf("%s",cbca);
                            if(strcmp("sim", cbca)==0){
                                printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
                            }
                            else{
                                printf("\nte tid dores nos musculos? ");
                                scanf("%s", blha);
                                if(strcmp("sim",blha )==0){
                                    printf("BRUCELOSE- PARANZYME TETRACICLINA- 500mg a cada 6h por 3semanas");
                                }
                                else{
                                    printf("\nesta com dobras vermelhas na axilas? ");
                                    scanf("%s", mcha);
                                    if(strcmp("sim",mcha)==0){
                                        printf("\nESCArLATINA-Keflex 500mg\n");
                                    }
                                    else{
                                        printf("\nsente algum mal estar?");
                                        scanf("%s",ftar);
                                        if(strcmp("sim",ftar)==0){
                                            printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                        }
                                        else{
                                            printf("\no seu olho esta inchado? ");
                                            scanf("%s", olhs);
                                            if(strcmp("sim",olhs)==0){
                                                printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                            }
                                            else{
                                                printf("\n sente nauseas? ");
                                                scanf("%s", ftar);
                                                if(strcmp("sim",ftar)==0){
                                                    printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                                }
                                                else{
                                                    printf("\ntem tido diarreias? ");
                                                    scanf("%s",diar);
                                                    if(strcmp("sim",diar)==0){
                                                        printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                                    }
                                                    else{
                                                        printf("\nestah com nodulos? ");
                                                        scanf("%s", clfr);
                                                        if(strcmp("sim",clfr)==0){
                                                            printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                                        }
                                                        else{
                                                            printf("\nGripe comum- repouso e ingestao de bastante agua ");
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        }
                }
                else{
                    printf("\ntem dores pelo corpo? ");
                    scanf("%s",drre);
                    if(strcmp("sim",drre)==0){
                        printf("\ntem tido dores de garganta?");
                        scanf("%s",gnta);
                        if(strcmp("sim",gnta)==0){
                            printf("TOXOPLASMOSE- Rovamicina 16 comprimidos para duas semanas\n");
                        }
                        else{
                            printf("\ntem tido calafrios, associados a delirios? ");
                            scanf("%s",ftar);
                            if(strcmp("sim",ftar)==0){
                                printf("\nMALARIA= Injecao de risperdal- Internamento obrigatorio\n");
                            }
                            else{
                                printf("\ntem tido diarreias? ");
                                scanf("%s",diar);
                                if(strcmp("sim",diar)==0){
                                    printf("LEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                                }
                                else{
                                    printf("\n tem tidos ataques de tosse? ");
                                    scanf("%s",tsse);
                                    if(strcmp("sim",tsse)==0){
                                        printf("LEPTOSPIROSE- vibramicina, comprimidos de 200mg");
                                    }
                                    else{
                                        printf("\nesta com dobras vermelhas na axila? ");
                                        scanf("%s",tsse);
                                        if(strcmp("sim",tsse)==0){
                                            printf("ESCARLATINA- KEFLEX, 500mg \n\n\n");
                                        }
                                        else{
                                            printf("\nGripe comum- uso de vitaminas e ingestao de bastante agua ");
                                        };
                                    };
                                };
                            };
                        };
                    }
                    else{
                        printf("\ntem falta de apetite? ");
                        scanf("%s",lnga);
                        if(strcmp("sim",lnga)==0){
                             printf("FEBRE TIFoIDE- Amoxicilina em Qualquer forma e Dose");
                        }
                        else{
                            printf("\n gripe comum: evitar choques termicos, permanecer em repouso, alimentar-se direito, etc");
                        };
                    };
                };
        };
    };
}
else{
        printf("\nteve dores no abdomen? ");
        scanf("%s",abdm);
        if(strcmp("sim",abdm)==0){
        printf("\nDIAGNOSTICADO Teniase- ATENASE, %fml de a cada 24 HORAS \n\n\n ", liq);
        }
        else{
                printf("\nteve enjoos? ");
                scanf("%s", ftar);
                if(strcmp("ftar", ftar)==0){
                printf("\nDIAGNOSTICADO Teniase- ATENASE, %fml de a cada 24 HORAS \n\n\n ", liq);
                }
                else{
                    printf("\nteve perda de apetite? ");
                    scanf("%s", ftar);
                    if(strcmp("ftar", ftar)==0){
                    printf("\nDIAGNOSTICADO Teniase- ATENASE, %fml de a cada 24 HORAS \n\n\n ", liq);
                    }
                    else{
                        printf("\nEstá com cansaço ou insonia? ");
                        scanf("%s", ftar);
                        if(strcmp("ftar", ftar)==0){
                          printf("\nDIAGNOSTICADO Teniase- ATENASE, %fml de a cada 24 HORAS \n\n\n ", liq);
                        }
                        else{
                        printf("Gripe Comum : Recomenda-se repouso e ingestao de liquidos");
                        };
                    };
                };
        };
};
                        cnt=1;
                    }
                else{
                    if(strcmp(doer, "garganta")==0){
                            printf("\nTeve febre desde que os sintomas comecaram? ");
scanf("%s",clfr);
if(strcmp("sim",clfr )==0){
        printf("\nteve dificuldade para respirar? ");
        scanf("%s",ftar);
        if(strcmp("sim",ftar)==0){
            printf("\nha uma membrana cobrindo a sua garganta ou corrimento nasal excessivo?  ");
            scanf("%s",drre);
            if(strcmp(drre,"sim")==0){
            printf("\nDIFTERIA- IMUNOGLOBULINA ANTI-D INJETADA\n\n");
            }
            else{
                printf("\nvoce tem dificuldade de engolir, acompanhada por excesso de saliva? ");
                scanf("%s", anus);
                if(strcmp("sim",anus )==0){
                printf("\nEPIGLOTITE- 5 Ampolas com 20 ml de DIPRIVAN 1 pcnto\n");
                }
                else{
                    printf("\nInfeccao bacteriana-Pastilhas de flurbiprofeno 8,75mg-usar uma a cada 3 horas ");
                };
            };
        }
            else{
                printf("\nteve corrimento nasal em voce? ");
                scanf("%s", lnga);
                if(strcmp("sim",lnga)==0){
                    printf("\nFARINGITE-%fmg de Vasativ\n", sol);
                }
                else{
                    printf("\nInfeccao bacteriana-Pastilhas de flurbiprofeno 8,75mg-usar uma a cada 3 horas ");
                };
            };
}
else{
    printf("\nteve dores no ouvido? ");
    scanf("%s",ovdo);
    if(strcmp("sim",ovdo)==0){
        printf("sinusite- KEFLEX 500mg ate curar-");
    }
    else{
        printf("\nesta tendo tosses? ");
        scanf("%s", tsse);
        if(strcmp("sim",tsse)==0){
            printf("sinusite- KEFLEX 500mg ate curar-");
        }
        else{
            printf("\nesta tendo dores de cabeca? ");
            scanf("%s",cbca);
            if(strcmp("sim",cbca)==0){
            printf("\nDIAGNOSTICADO_-TOXOPLASMOSE_-16 COMPRIMIDOS DE ROVAMICINA 500mg\n");
            }
            else{
              printf("\nesta tendo dores pelo corpo e cansaco? ");
              scanf("%s",cstas);
              if(strcmp("sim",cstas)==0){
            printf("\nDIAGNOSTICADO_-TOXOPLASMOSE_-16 COMPRIMIDOS DE ROVAMICINA 500mg\n");
              }
              else{
                printf("\nInfeccao bacteriana-Pastilhas de flurbiprofeno 8,75mg-usar uma a cada 3 horas ");
              };
            };
        };
    };
};
                    cnt=1;
                    }
                    else{
                        if(strcmp(doer, "testiculos")==0){
                                printf("CLAMIDIA-AZITROMICINA %fmg",sol );
                            cnt=1;
                        }
                        else{
                                if(strcmp(doer, "anus")==0){
                                        printf("OXIURIASE- %fml de por uma semana lactovagin",liq );
                                    cnt=1;
                                }
                                else{
                                    if(strcmp(doer, "corpo")==0){
                                            printf("\nTEM INCHACOS NA PELE OU OLHOS?\n");
                                            scanf("%s", olhs);
                                            if(strcmp("sim", olhs)==0){
                                                printf("CHAGAS- cordilat 80 mg por 10 semanas\n");
                                            }
                                            else{
                                                printf("\nTEM VOMITOS?\n");
                                                scanf("%s", blha);
                                                if(strcmp("sim", blha)==0){
                                                    printf("Leptospirose- Vilova micina Comprimidos 200mg ate acabar a cartela, um por dia\n");
                                                }
                                                else{
                                                    printf("TOXOPLASMOSE- Rovamicina 16 comprimidos para duas semanas\n");
                                                };
                                            };
                                        cnt=1;
                                    }
                                    else{
                                        if(strcmp(doer, "ouvido")==0){
                                                printf("sinusite- KEFLEX 500mg ate curar-");
                                            cnt=1;
                                        }
                                        else{ printf("DESCULPA, PODERIA SER UM POUCO MAIS ESPECIFICO?[abdomen, costas,cabeca, garganta, corpo, ouvido]\n         ");
                                                                    cnt=0;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
return 0;
        };
        struct weed{
            char nom[89];
            char sexo[12];
        };
int coceira(){
    printf("Voce tem coceira na vagina?\n");
    scanf("%s", clfr);
    if(strcmp("sim", clfr)==0){
        printf("\nTricomoniase-Scnoziol %fml oral ate curar\n", liq/v);
       }
       else{
        printf("\nAncilostomiase-  Pantelmin- 100mg ao dia até curar\n");
       };
       return 0;
};
int manchas(){
    printf("\nVOCÊ PERDEU A SENSIBILIDADE NESSES PONTOS?\n");
scanf("%s", gnta);
if(strcmp("sim", gnta)==0){
    printf("\nHanseniase-pomada MINOCICLINA- aplicar sobre as areas afetadas\n");
}
else{
        printf("TEM DOR DE CABECA?\n");
        scanf("%s",cbca);
    if(strcmp("sim", cbca)==0){
        printf("\nLYME- ceftriaxona sodica injetada\n");
    }
    else{
        printf("\nSUSPEITA DE MENINGITE-CONSULTE AO DERMATOLOGISTA\n");
    };
};
return 0;
};
int diarreia(){
printf("\nVoce tem tido Sangue nas fezes?\n");
scanf("%s", ftar);
if(strcmp("sim", ftar)==0){
    printf("\nDISENTERIA- Netrodazol- 3 comprimidos a cada 8 Horas\n");
}
else{
        printf("tem tido arrotos?");
        scanf("%s", cstas);
if(strcmp("sim",cstas )==0){
        printf("\nGIARDIASE-BENZOILMETRNIDAZOL \n%fmg por dia até mehorar\n",sol );
}
else{
    printf("\nOXIURIASE-lacto vagin %fml \n",liq );
};
};
return 0;
};
int vomito(){
printf("\nVoce ^ sente sede excessiva e a boca seca?\n");
scanf("%s", cstas);
if(strcmp("sim", cstas)==0){
    printf("\nCOLERA- use PENOCRIS- 10 frascos de 20 ml\n");
}
else{
        printf("\nTRICURIASE- use ALBA 3 %fmg\n", sol);
};
return 0;
};
int main(){
    int idade[2][2];
int resp=1;
    struct weed pessoa;
while(resp==1){
printf("\t\t\t---------MEDICO VIRTUAL----------\n");
printf("\n *Qual eh a sua idade? \n    ");
scanf("%d", &idade[1][1]);
idade[2][1]=(idade[1][1])*2;
printf("\n*Qual eh o seu sexo?[m]=masculino, [f]=feminino  \n     ");
scanf("%s", pessoa.sexo);
printf("\nQUAL E O SEU PRIMEIRO NOME? (sem espaco)\n ");
scanf("%s",pessoa.nom );
printf("\nQUAL Eh O SEU PESO[kg]\n");
scanf("%f", &p );
v=idade[2][1];
sol=p/10;
liq=p/8;
printf("\nDIGA-ME O QUE ESTAS SENTINDO [digite sem acento nem ce-cedilha, no caso de dor, digite apenas 'dor', depois perguntarei onde]\n");
int ment=0;
while(ment!=1){
scanf("%s",sinprim);
if (strcmp(sinprim, "tosse")==0 ){
sp=1;
ment=1;
}
else{
    if (strcmp(sinprim, "dor")==0 ){
    sp=2;
    ment=1;}
    else{
        if (strcmp(sinprim, "coceira")==0 ){
        sp=3;
        ment=1;}
        else{
            if (strcmp(sinprim, "manchas")==0 ){
            sp=4;
            ment=1;}
            else{
                if (strcmp(sinprim, "diarreia")==0 ){
                    sp=5;
                    ment=1;}
                else{
                    if (strcmp(sinprim, "vomito")==0 ){
                        sp=6;
                        ment=1;}
                    else{ printf("\nDESCULPA, EU NAO ENTENDI, SERA QUE PODERIA SER MAIS ESPECIFICO?[tosses, dores, coceira, manchas, diarreia ou vomito]\n");
                        };
                    };
                };
            };
        };
    };
cnt=0;
};
if (sp==2 ){
        ret= dores();
        };
if (sp==1){
    ret=tosse();
};
if(sp==3){
    ret=coceira();
};
if(sp==4){
    ret=manchas();
};
if(sp==5){
  ret=diarreia();
};
if(sp==6){
    ret=vomito();
};
printf("\nprograma feito por (ANDRADE), lucas rafael de & '(ASSUMPCAO),felipe\n' ");
printf("\ndeseja recomecar?[1]-SIM/[2]-NAO\n");
scanf("%d", &resp);
};
}